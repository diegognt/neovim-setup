local status_ok, comment = pcall(require, 'Comment')
if not status_ok then
  vim.notify('The `numToStr/Comment.nvim` plugin was not found.')
  return
end

comment.setup {
  pre_hook = function(context)
    local Utils = require 'Comment.utils'

    local location = nil
    if context.ctype == Utils.ctype.block then
      location = require('ts_context_commentstring.utils').get_cursor_location()
    elseif context.cmotion == Utils.cmotion.v or context.cmotion == Utils.cmotion.V then
      location = require('ts_context_commentstring.utils').get_visual_start_location()
    end

    return require('ts_context_commentstring.internal').calculate_commentstring {
      key = context.ctype == Utils.ctype.line and '__default' or '__multiline',
      location = location,
    }
  end,
}
