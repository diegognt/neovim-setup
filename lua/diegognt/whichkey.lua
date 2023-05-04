local M = {}
M.opts = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<CR>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  window = {
    border = 'rounded', -- none, single, double, shadow
    position = 'bottom', -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = 'left', -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = 'auto', -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { 'j', 'k' },
    v = { 'j', 'k' },
  },
}

M.mappings_opts = {
  mode = 'n', -- NORMAL mode
  prefix = '<leader>',
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

M.mappings = {
  ['b'] = {
    '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown{previewer = false})<CR>',
    'Buffers',
  },
  ['e'] = { '<cmd>Neotree toggle<CR>', 'Explorer' },
  ['w'] = { '<cmd>w!<CR>', 'Save' },
  ['q'] = { '<cmd>q!<CR>', 'Quit' },
  ['c'] = { '<cmd>Bdelete!<CR>', 'Close Buffer' },
  ['h'] = { '<cmd>Telescope help_tags<CR>', 'Find on nvim help' },
  ['f'] = {
    '<cmd>lua require("telescope.builtin").git_files(require("telescope.themes").get_dropdown({previewer = false}))<CR>',
    'Find files',
  },
  ['M'] = { '<cmd>Mason<CR>', 'Mason' },
  ['D'] = { '<cmd>lua require("dap").continue()<CR>', 'Debugging' },
  ['K'] = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover' },
  ['F'] = { '<cmd>Telescope live_grep<CR>', 'Find Text' },
  ['L'] = { '<cmd>Lazy<CR>', 'Lazy' },
  ['P'] = { '<cmd>lua require("telescope").extensions.projects.projects()<CR>', 'Projects' },
  a = {
    name = 'Annotation',
    a = { '<cmd>lua require("neogen").generate()<CR>', 'Annotation' },
    c = { '<cmd>lua require("neogen").generate({type = "class"})<CR>', 'Class' },
    f = { '<cmd>lua require("neogen").generate({type = "func"})<CR>', 'Function' },
  },
  A = {
    name = 'Asistant',
    p = { '<cmd>NeoAIToggle<CR>', 'Prompt' },
  },
  C = {
    name = 'Copilot',
    d = { '<cmd>Copilot disable<CR>', 'Disable' },
    e = { '<cmd>Copilot enable<CR>', 'Enable' },
  },
  g = {
    name = 'Go to',
    d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Definition' },
    D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration' },
    i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation' },
    r = { '<cmd>lua vim.lsp.buf.references()<CR>', 'References' },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type definition' },
  },
  G = {
    name = 'Git',
    -- g = { '<cmd>lua _LAZYGIT_TOGGLE()<CR>', 'Lazygit' },
    j = { '<cmd>lua require "gitsigns".next_hunk()<CR>', 'Next Hunk' },
    k = { '<cmd>lua require "gitsigns".prev_hunk()<CR>', 'Prev Hunk' },
    l = { '<cmd>lua require "gitsigns".blame_line()<CR>', 'Blame' },
    p = { '<cmd>lua require "gitsigns".preview_hunk()<CR>', 'Preview Hunk' },
    r = { '<cmd>lua require "gitsigns".reset_hunk()<CR>', 'Reset Hunk' },
    R = { '<cmd>lua require "gitsigns".reset_buffer()<CR>', 'Reset Buffer' },
    s = { '<cmd>lua require "gitsigns".stage_hunk()<CR>', 'Stage Hunk' },
    u = {
      '<cmd>lua require "gitsigns".undo_stage_hunk()<CR>',
      'Undo Stage Hunk',
    },
    o = { '<cmd>Telescope git_status<CR>', 'Open changed file' },
    c = { '<cmd>Telescope git_commits<CR>', 'Checkout commit' },
    d = { '<cmd>Gitsigns diffthis HEAD<CR>', 'Diff' },
    b = { '<cmd>Telescope git_branches<CR>', 'Checkout branch' },
  },
  l = {
    name = 'LSP',
    a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
    f = { '<cmd>lua vim.lsp.buf.format { async = true }<CR>', 'Format' },
    e = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Diagnostic' },
    i = { '<cmd>LspInfo<CR>', 'Info' },
    l = { '<cmd>lua vim.lsp.codelens.run()<CR>', 'CodeLens Action' },
    k = { '<cmd> lua vim.lsp.buf.signature_help()<CR>', 'Symbol Signature' },
    r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
    s = { '<cmd>Telescope lsp_document_symbols<CR>', 'Document Symbols' },
    S = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature help' },
  },
  m = {
    name = 'Mode',
    t = { '<cmd>Twilight<CR>', 'Twilight' },
  },
  N = {
    name = 'Notifications',
    a = { '<cmd>lua require("noice").cmd("all")<CR>', 'All' },
    l = { '<cmd>Noice last<CR>', 'Last one' },
    h = { '<cmd>Noice <CR>', 'History' },
    e = { '<cmd>Noice errors<CR>', 'Errors' },
  },
  s = {
    name = 'Search',
    c = { '<cmd>Telescope colorscheme<CR>', 'Colorscheme' },
    M = { '<cmd>Telescope man_pages<CR>', 'Man Pages' },
    r = { '<cmd>Telescope oldfiles<CR>', 'Open Recent File' },
    R = { '<cmd>Telescope registers<CR>', 'Registers' },
    k = { '<cmd>Telescope keymaps<CR>', 'Keymaps' },
    C = { '<cmd>Telescope commands<CR>', 'Commands' },
    t = { '<cmd>TodoTelescope<CR>', 'TODOs' },
  },
  t = {
    name = 'Terminal',
    n = { '<cmd>lua _NODE_TOGGLE()<CR>', 'Node' },
    u = { '<cmd>lua _NCDU_TOGGLE()<CR>', 'NCDU' },
    t = { '<cmd>lua _HTOP_TOGGLE()<CR>', 'Htop' },
    p = { '<cmd>lua _PYTHON_TOGGLE()<CR>', 'Python' },
    f = { '<cmd>ToggleTerm direction=float<CR>', 'Float' },
    h = { '<cmd>ToggleTerm size=10 direction=horizontal<CR>', 'Horizontal' },
    v = { '<cmd>ToggleTerm size=80 direction=vertical<CR>', 'Vertical' },
  },
  T = {
    name = 'Test',
    r = { '<cmd>lua require("neotest").run.run()<CR>', 'Run nearest' },
    f = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', 'Run File' },
    p = { '<cmd>lua require("neotest").output_panel.open()<CR>', 'Panel' },
    s = { '<cmd>lua require("neotest").summary.open()<CR>', 'Tests Summary' },
  },
  x = {
    name = 'Diagnostic',
    d = { '<cmd>Trouble document_diagnostics<CR>', 'Document' },
    j = { '<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>', 'Next Diagnostic' },
    k = { '<cmd>lua vim.diagnostic.goto_prev({buffer=0})<CR>', 'Previous Diagnostic' },
    f = { 'lua vim.diagnostic.open_float()<CR>', 'Float window' },
    w = { '<cmd>Trouble workspace_diagnostics<CR>', 'Workspace' },
    t = { '<cmd>TodoTrouble<CR>', 'TODOs' },
    q = { '<cmd>Trouble quickfix<CR>', 'Quickfix' },
  },
}

return M
