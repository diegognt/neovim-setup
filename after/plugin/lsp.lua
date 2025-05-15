local LspConfigGroup = vim.api.nvim_create_augroup("LspConfig", { clear = true })

local keymap = require("globals").keymaps.set
local icons = require "globals.icons"
local lsp_servers = require "globals.lsp"
local progress = vim.defaulttable()

vim.api.nvim_create_autocmd("LspProgress", {
  group = LspConfigGroup,
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local value = event.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
    if not client or type(value) ~= "table" then
      return
    end
    local p = progress[client.id]

    for i = 1, #p + 1 do
      if i == #p + 1 or p[i].token == event.data.params.token then
        p[i] = {
          token = event.data.params.token,
          msg = ("[%3d%%] %s%s"):format(
            value.kind == "end" and 100 or value.percentage or 100,
            value.title or "",
            value.message and (" **%s**"):format(value.message) or ""
          ),
          done = value.kind == "end",
        }
        break
      end
    end

    local msg = {} ---@type string[]
    progress[client.id] = vim.tbl_filter(function(v)
      return table.insert(msg, v.msg) or not v.done
    end, p)

    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(table.concat(msg, "\n"), vim.log.levels.INFO, {
      id = "lsp_progress",
      title = client.name,
      opts = function(notif)
        notif.icon = #progress[client.id] == 0 and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = LspConfigGroup,
  callback = function(event)
    keymap("n", "gd", Snacks.picker.lsp_definitions, { desc = "[g]o to [d]efinition" })
    keymap("n", "gD", Snacks.picker.lsp_declarations, { desc = "[g]o to [D]eclaration" })
    keymap("n", "gi", Snacks.picker.lsp_implementations, { desc = "[g]o to [I]mplementation" })
    keymap("n", "gr", Snacks.picker.lsp_references, { desc = "[g]o to [r]eferences" })
    keymap("n", "<leader>la", vim.lsp.buf.code_action, { desc = "[l]sp Code [a]ction" })
    keymap("v", "<leader>la", vim.lsp.buf.code_action, { desc = "[l]sp Code [a]ction" })
    keymap("n", "<leader>lr", vim.lsp.buf.rename, { desc = "[l]sp [r]ename" })
    keymap("n", "<leader>lh", vim.lsp.buf.signature_help, { desc = "[l]sp Signature [h]elp" })
    keymap("n", "<leader>td", Snacks.picker.lsp_type_definitions, { desc = "[t]ype [d]efinition" })
    keymap("n", "<leader>ls", Snacks.picker.lsp_symbols, { desc = "[l]sp Document [s]ymbols" })
    keymap("n", "<leader>ws", Snacks.picker.lsp_workspace_symbols, { desc = "[w]orkspace [s]ymbols" })
    keymap("n", "<leader>lf", function()
      vim.lsp.buf.format({
        async = true,
        filter = function(client)
          return client.name ~= "typescript-tools"
        end,
      })
    end, { desc = "[l]sp [f]ormat" })

    keymap("n", "K", function()
      vim.lsp.buf.hover({ border = "rounded" })
    end, { desc = "Hover" })

    -- Float Diagnostics
    keymap("n", "<leader>xf", vim.diagnostic.open_float, { desc = "Open Diagnostics on Float" })

    -- LSP Info
    -- keymap("n", "<leader>lI", "<cmd>LspInfo<CR>", "LSP Info")

    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if client and client.server_capabilities.codeLensProvider and vim.lsp.codelens then
      keymap("n", "<leader>ll", function()
        vim.lsp.codelens.refresh({ bufnr = event.buf })
      end, { desc = "Disp[l]ay Code [l]ens" })

      keymap("n", "<leader>lc", vim.lsp.codelens.run, { desc = "Run Code Lens" })
    end

    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      keymap("n", "<leader>lh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = "[l]sp Inlay [h]ints" })
    end

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed

    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    if client and client.server_capabilities.documentHighlightProvider then
      local LspHighlightGroup = vim.api.nvim_create_augroup("LspHighlight", { clear = true })

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = LspHighlightGroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = LspHighlightGroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("LspDetach", { clear = true }),
        callback = function(innerEvent)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = "LspHighlight", buffer = innerEvent.buf })
        end,
      })
    end
  end,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.BoldError,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.BoldWarning,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.BoldHint,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.BoldInformation,
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
    },
  },
  virtual_lines = {
    -- Only show virtual line diagnostics for the current cursor line
    current_line = true,
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    header = "Diagnostic",
    prefix = "",
  },
})

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable(lsp_servers)
