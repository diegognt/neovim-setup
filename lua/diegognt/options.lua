-- For mor options and information.
-- :help options

-- Helpers
local cmd = vim.cmd
local opt = vim.opt
local g = vim.g


-- Global options
g.skip_ts_context_commentstring_module = true

-- Commands
-- cmd('set inccommand=split')             -- show what you are substituting in real time
cmd('set iskeyword+=-')                        -- treat dash as a separate word
cmd('set whichwrap+=<,>,[,],h,l')              -- move to next line with theses keys
cmd('set foldmethod=expr')                     -- set foldmethod to expression
cmd('set foldexpr=nvim_treesitter#foldexpr()') -- set foldexpr to treesitter

-- User options
local options = {
  -- hidden = true                            -- required to keep multiple buffers and open multiple buffers
  backup = false,                          -- Creates a backup file
  clipboard = 'unnamedplus',               -- Allows neovim to access the system clipboard
  cmdheight = 1,                           -- More space in the neovim command line for displaying messages
  completeopt = { 'menuone', 'noselect' }, -- Mostly just for cmp
  conceallevel = 0,                        -- So that `` is visible in markdown files
  fileencoding = 'utf-8',                  -- The encoding written to a file
  hlsearch = true,                         -- Highlight all matches on previous search pattern
  ignorecase = true,                       -- Ignores case in search patterns
  mouse = 'a',                             -- Allows the mouse to be used in neovim
  pumheight = 10,                          -- Pop up menu height
  showmode = false,                        -- We don't need to see things like -- INSERT -- anymore
  showtabline = 1,                         -- Always show tabs
  smartcase = true,                        -- Smart case
  smartindent = true,                      -- Makes indenting smarter again
  splitbelow = true,                       -- Forces all horizontal splits to go below current window
  splitright = true,                       -- Forces all vertical splits to go to the right of current window
  swapfile = false,                        -- Creates a swapfile
  termguicolors = true,                    -- Sets term gui colors (most terminals support this)
  timeoutlen = 100,                        -- Time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- Enables persistent undo
  updatetime = 300,                        -- Faster completion (4000ms default)
  writebackup = false,                     -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- Converts tabs to spaces
  shiftwidth = 2,                          -- The number of spaces inserted for each indentation
  tabstop = 2,                             -- Inserts 2 spaces for a tab
  cursorline = true,                       -- Highlights the current line
  number = true,                           -- Sets the numbered lines
  relativenumber = true,                   -- Sets the relative numbered lines
  numberwidth = 4,                         -- Set the number column width to 2 {default 4}
  laststatus = 3,
  showcmd = false,
  ruler = false,
  signcolumn = 'yes',                      -- Always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- Displays lines as one long line
  scrolloff = 0,                           -- Is one of my fav
  sidescrolloff = 8,
  guifont = 'monospace:h17',               -- The font used in graphical neovim applications
  list = true,
  title = false,
  fillchars = opt.fillchars + "eob: "

}

opt.listchars:append('space:⋅')
opt.listchars:append('eol:')
opt.shortmess:append('c')
opt.shortmess:append "c"
opt.fillchars:append {
  stl = " ",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

g.netrw_banner = 0
g.netrw_mouse = 2
