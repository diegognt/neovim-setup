local GeneralSettingsGroup = vim.api.nvim_create_augroup("GeneralSettings", { clear = true })
local ResizeGroup = vim.api.nvim_create_augroup("AutoResize", { clear = true })

-- Closes some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = GeneralSettingsGroup,
  pattern = {
    "help",
    "man",
    "qf",
    "loclist",
    "oil",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Enable native Neovim treesitter highlighting globally
vim.api.nvim_create_autocmd("FileType", {
  group = GeneralSettingsGroup,
  pattern = "*",
  callback = function(args)
    local ft = vim.bo[args.buf].filetype

    -- 1. List of ft patterns to ignore
    local ignore_patterns = {
      "^$", -- Empty filetype
      "^snacks_",
      "^Telescope",
      "^lazy$",
      "^mason$",
      "^oil$",
      "^dap%-",
    }

    -- 2. Check if the filetype matches any of the patterns
    for _, pattern in ipairs(ignore_patterns) do
      if ft:match(pattern) then
        return
      end
    end

    local success = pcall(vim.treesitter.start)

    if not success then
      vim.notify(
        "No treesitter parser installed. Using nvim regex syntax.",
        vim.log.levels.INFO,
        { title = "Treesitter (" .. ft .. ")" }
      )
    end
  end,
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
    require("vim.hl").on_yank({ higroup = "Search", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter", "BufRead", "BufNewFile" }, {
  group = GeneralSettingsGroup,
  pattern = "*",
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = GeneralSettingsGroup,
  pattern = "qf",
  command = "set nobuflisted",
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

-- Remove trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
  group = GeneralSettingsGroup,
  desc = "Remove trailing whitespace",
  command = ":%s/\\s\\+$//e",
})
