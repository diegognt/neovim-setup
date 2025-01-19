return {
  { "<leader><leader>", function() Snacks.picker.buffers() end, desc = "Buffers" },
  -- Find
  { "<leader>f", function() Snacks.picker.git_files() end, desc = "[f]ind files" },
  -- Search
  { "<leader>sh", function() Snacks.picker.help() end, desc = "[s]earch on [h]elp Pages" },
  { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
  { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
  -- Grep
  { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
  { "<leader>s/", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
  -- Scratch
  { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
  { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
}
