return {
  {
    "<leader><leader>",
    function()
      Snacks.picker.buffers()
    end,
    desc = "Buffers",
  },
  -- Find
  {
    "<leader>f",
    function()
      Snacks.picker.git_files()
    end,
    desc = "[f]ind files",
  },
  -- Search
  {
    "<leader>sh",
    function()
      Snacks.picker.help()
    end,
    desc = "[s]earch on [h]elp Pages",
  },
  {
    "<leader>sk",
    function()
      Snacks.picker.keymaps()
    end,
    desc = "[s]earch [k]eymaps",
  },
  {
    "<leader>sC",
    function()
      Snacks.picker.commands()
    end,
    desc = "[s]earch [C]ommands",
  },
  -- Grep
  {
    "<leader>/",
    function()
      Snacks.picker.grep()
    end,
    desc = "Grep",
  },
  {
    "<leader>s/",
    function()
      Snacks.picker.grep_buffers()
    end,
    desc = "Grep Open Buffers",
  },
  -- Scratch
  {
    "<leader>.",
    function()
      Snacks.scratch()
    end,
    desc = "Toggle Scratch Buffer",
  },
  {
    "<leader>S",
    function()
      Snacks.scratch.select()
    end,
    desc = "Select Scratch Buffer",
  },
  {
    "<leader>nh",
    function()
      Snacks.notifier.show_history()
    end,
    desc = "[n]otification [h]istory",
  },
  -- Buf delete
  {
    "<leader>c",
    function()
      Snacks.bufdelete.delete()
    end,
    desc = "[c]lose current buffer",
  },
}
