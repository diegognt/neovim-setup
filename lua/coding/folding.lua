local handle_folded_virtual_text = function(virtText, lnum, endLnum, width, truncate)
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

local statuscol_opts = function()
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

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      opts = statuscol_opts,
    }
  },
  opts = {
    fold_virt_text_handler = handle_folded_virtual_text,
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
