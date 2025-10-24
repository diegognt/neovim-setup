return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      colors = {
        palette = {
          oldWhite = "#D8D3C0",
          fujiWhite = "#E8E5D3",
          lotusWhite0 = "#E0DCCE",
          lotusWhite1 = "#E8E3D5",
          lotusWhite2 = "#ECE9D8",
          lotusWhite3 = "#F5F3E6",
          lotusWhite4 = "#E8E0CE",
          lotusWhite5 = "#E5DCBC",
          fujiGray = "#747370",
          lotusGray = "#E8E5D3",
          lotusGray2 = "#73706B",
          lotusGray3 = "#8C8B85",
          dragonGray = "#A9A9A3",
          dragonGray2 = "#A09D96",
          dragonGray3 = "#7D8585",
          dragonWhite = "#CBCFCB",
          autumnYellow = "#DCA561",
          boatYellow1 = "#A08F6A",
          boatYellow2 = "#C9B38D",
          carpYellow = "#EBD09C",
          roninYellow = "#FFAB59",
          dragonYellow = "#CFB998",
          lotusYellow = "#827C4E",
          lotusYellow2 = "#8F7C5D",
          lotusYellow3 = "#E8A810",
          lotusYellow4 = "#F9E0A7",
          winterYellow = "#4E4941",
        },
      },
    })
    vim.cmd.colorscheme "kanagawa-wave"
  end,
}
