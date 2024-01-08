local Spec = {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "kevinhwang91/promise-async",
    "luukvbaal/statuscol.nvim",
  },
  opts = {
    close_fold_kinds = {},
    preview = {
      win_config = {
        border = { "", "─", "", "", "", "─", "", "" },
        winhighlight = "Normal:Folded",
        winblend = 0,
      },
      mappings = {
        scrollU = "<C-k>",
        scrollD = "<C-j>",
        jumpTop = "[",
        jumpBot = "]",
      },
    },
  },
}

function Spec.set_keymaps()
  vim.keymap.set("n", "zO", require("ufo").openAllFolds)
  vim.keymap.set("n", "zC", require("ufo").closeAllFolds)
end

function Spec.set_nvim_options()
  vim.o.foldcolumn = "1" -- '0' is not bad
  vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  vim.o.foldlevelstart = 99
  vim.o.foldenable = true
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
end

Spec.handle_folded_virtual_text = function(
  virtText,
  lnum,
  endLnum,
  width,
  truncate
)
  local newVirtText = {}
  local suffix = (" 󰡏 %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

Spec.statuscol_opts = function()
  local builtin = require "statuscol.builtin"
  local statuscol_opts = {
    setopt = true,
    relculright = true,
    segments = {
      {
        text = { builtin.foldfunc, " " },
        click = "v:lua.ScFa",
        hl = "Comment",
      },
      { text = { "%s" }, click = "v:lua.ScSa" },
      { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    },
  }
  return statuscol_opts
end

function Spec.config(_, opts)
  require("statuscol").setup(Spec.statuscol_opts())

  Spec.set_nvim_options()

  local custom_opts = {
    fold_virt_text_handler = Spec.handle_folded_virtual_text,
    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
      -- refer to ./doc/example.lua for detail
    end,
  }

  require("ufo").setup(vim.tbl_deep_extend("force", opts, custom_opts))
  Spec.set_keymaps()
end

return Spec
