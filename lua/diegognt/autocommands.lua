local GeneralSettingsGroup = vim.api.nvim_create_augroup("GeneralSettings", { clear = true })
local CodeAnalysisGroup = vim.api.nvim_create_augroup("CodeAnalysis", { clear = true })
local AstroGroup = vim.api.nvim_create_augroup("AstroFiles", { clear = true })
local SpelledGroup = vim.api.nvim_create_augroup("SpelledFiles", { clear = true })
local AlphaGroup = vim.api.nvim_create_augroup("AlphaUser", { clear = true })
local ResizeGroup = vim.api.nvim_create_augroup("AutoResize", { clear = true })
local LspConfigGroup = vim.api.nvim_create_augroup("LspConfig", { clear = true })

vim.api.nvim_create_autocmd("BufUnload", {
  group = AlphaGroup,
  pattern = "alpha",
  command = "vim.opt.showtabline = 2",
})

vim.api.nvim_create_autocmd("VimResized", {
  group = ResizeGroup,
  pattern = "*",
  command = "tabdo wincmd =",
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = GeneralSettingsGroup,
  pattern = "*",
  desc = "Highlight text on yank",
  callback = function()
    require("vim.highlight").on_yank({ higroup = "Search", timeout = 200 })
  end,
})

-- Closes some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = GeneralSettingsGroup,
  pattern = {
    "qf",
    "oil",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = GeneralSettingsGroup,
  pattern = "qf",
  command = "set nobuflisted",
})

vim.api.nvim_create_autocmd("FileType", {
  group = GeneralSettingsGroup,
  pattern = "markdown",
  command = "set conceallevel=2",
})

vim.api.nvim_create_autocmd({ "BufWinEnter", "BufRead", "BufNewFile" }, {
  group = GeneralSettingsGroup,
  pattern = "*",
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- Wraps and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = SpelledGroup,
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Astro filetype
vim.api.nvim_create_autocmd({ "BufRead", "BufEnter" }, {
  group = AstroGroup,
  pattern = "*.astro",
  command = "set filetype=astro",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufEnter" }, {
  group = CodeAnalysisGroup,
  pattern = { ".prettierrc", ".stylelintrc" },
  command = "set filetype=json",
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = GeneralSettingsGroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Lsp
vim.api.nvim_create_autocmd("LspAttach", {
  group = LspConfigGroup,
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true, noremap = true }
    local keymap = vim.keymap.set

    -- LSP default
    keymap("n", "gd", vim.lsp.buf.definition, vim.tbl_deep_extend("force", opts, { desc = "Go to Definition" }))
    keymap("n", "gD", vim.lsp.buf.declaration, vim.tbl_deep_extend("force", opts, { desc = "Go to Declaration" }))
    keymap("n", "K", vim.lsp.buf.hover, vim.tbl_deep_extend("force", opts, { desc = "Hover" }))
    keymap("n", "gi", vim.lsp.buf.implementation, vim.tbl_deep_extend("force", opts, { desc = "Go to Implementation" }))
    keymap("n", "gr", vim.lsp.buf.references, vim.tbl_deep_extend("force", opts, { desc = "Go to References" }))
    keymap(
      { "n", "v" },
      "<leader>la",
      vim.lsp.buf.code_action,
      vim.tbl_deep_extend("force", opts, { desc = "Code Action" })
    )
    keymap("n", "<leader>lr", vim.lsp.buf.rename, vim.tbl_deep_extend("force", opts, { desc = "Rename" }))
    keymap(
      "n",
      "<leader>lk",
      vim.lsp.buf.signature_help,
      vim.tbl_deep_extend("force", opts, { desc = "Signature Help" })
    )
    keymap(
      "n",
      "<leader>td",
      vim.lsp.buf.type_definition,
      vim.tbl_deep_extend("force", opts, { desc = "Type Definition" })
    )
    keymap("n", "<leader>lf", function()
      vim.lsp.buf.format({
        async = true,
        filter = function(client)
          return client.name ~= "typescript-tools"
        end,
      })
    end, vim.tbl_deep_extend("force", opts, { desc = "Format" }))

    -- Workspace actions
    keymap(
      "n",
      "<leader>Wa",
      vim.lsp.buf.add_workspace_folder,
      vim.tbl_deep_extend("force", opts, { desc = "Add Workspace Folder" })
    )

    keymap(
      "n",
      "<leader>Wr",
      vim.lsp.buf.remove_workspace_folder,
      vim.tbl_deep_extend("force", opts, { desc = "Remove Workspace Folder" })
    )

    keymap("n", "<leader>Wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, vim.tbl_deep_extend("force", opts, { desc = "List Workspace Folders" }))

    -- Float Diagnostics
    keymap(
      "n",
      "<leader>xf",
      vim.diagnostic.open_float,
      vim.tbl_deep_extend("force", opts, { desc = "Open Diagnostics on Float" })
    )

    -- Code Lenses
    keymap("n", "<C-r>", vim.lsp.codelens.refresh, vim.tbl_deep_extend("force", opts, { desc = "Refresh Code Lens" }))
    keymap("n", "<leader>lc", vim.lsp.codelens.run, vim.tbl_deep_extend("force", opts, { desc = "Run Code Lens" }))

    -- Inlay Hints
    if vim.lsp.inlay_hint then
      keymap("n", "<leader>lh", function()
        vim.lsp.inlay_hint.enable(ev.buf, not vim.lsp.inlay_hint.is_enabled(ev.buf))
      end, vim.tbl_deep_extend("force", opts, { desc = "Inlay Hints" }))
    end

    -- LSP Info
    keymap("n", "<leader>lI", "<cmd>LspInfo<CR>", vim.tbl_deep_extend("force", opts, { desc = "LSP Info" }))
  end,
})
