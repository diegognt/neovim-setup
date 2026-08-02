# AGENTS.md

Personal Neovim config for Neovim 0.11+/0.12 (currently 0.12.x), symlinked to `~/.config/nvim`. There is no build, test suite, lint, or CI — the repo is pure Lua runtime config. Verify changes by running `nvim` (the config is live via the symlink); use `nvim --headless` for non-interactive checks.

## Layout & load order

- `init.lua` requires `lua/config/{options,autocommands,keymaps,lazy}.lua` in that order.
- `lua/config/lazy.lua` bootstraps lazy.nvim and imports plugin specs from `plugins`, `extras`, `snacks`, `coding`. Each file under those dirs returns a lazy spec (or array). Subdirs (`plugins/buffers`, `plugins/git`) have an `init.lua` that `require`s the individual spec files.
- `after/plugin/lsp.lua` is a runtime plugin script: global LSP keymaps, `LspAttach`/`LspProgress` autocmds, diagnostic config, and `vim.lsp.config("*")` capabilities.
- `after/lsp/<server>.lua` are **auto-loaded `vim.lsp.config` tables** (Neovim resolves `lsp/*.lua` from the runtimepath). The filename must match the server id exactly (e.g. `ts_ls.lua`), and the file must return a `---@type vim.lsp.Config` table (`settings`, `on_attach`, `single_file_support`, ...). These are NOT lazy specs.

## LSP setup (do not use nvim-lspconfig's per-server setup)

LSP uses the built-in `vim.lsp.config` API. `lua/globals/lsp.lua` is the list of servers passed to `mason-lspconfig`'s `ensure_installed`. To add a server: add its id to `lua/globals/lsp.lua` and (optionally) add `after/lsp/<server>.lua`.

## Conventions

- Use `globals.keymaps.set(mode, key, action, opts)` from `lua/globals/init.lua` instead of raw `vim.keymap.set` — it applies per-mode defaults (`noremap`, `silent`).
- Keymap `desc`s use which-key bracket notation: `"[l]sp [f]ormat"`, `"[w]rite current buffer"`.
- OS-dependent behavior branches on `globals.os` (`"Linux"` vs `"Darwin"`), e.g. window navigation in `lua/config/keymaps.lua`.
- Stylua style per `.stylua.toml`: 2-space indent, 120-col width, double quotes, `call_parentheses = "NoSingleString"`. So single-arg string calls are written without parens: `require "globals.lsp"`, `vim.cmd "set ..."`. `stylua` is not installed here, so match the style by hand. null-ls runs stylua on save for this repo.
- `lazy-lock.json` is committed; keep it in sync when plugin versions/specs change.

## Gotchas

- `TODO.md` is a plugin audit roadmap whose claims are often stale or speculative (e.g. a `vim.pack` API and which-key/trouble v3 rewrites). Verify against the actually installed plugins before acting on it.
- `after/plugin/lsp.lua` runs before plugins fully load in some contexts; it relies on the `Snacks` global (loaded with `priority = 1000`, `lazy = false` in `lua/snacks/spec.lua`) — don't lazy-load snacks.
- The repo still uses trouble.nvim v2-style `opts` (`auto_close`, `signs`) — do not "modernize" without checking the pinned version in `lazy-lock.json`.
