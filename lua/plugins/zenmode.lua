return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup({
      window = {
        width = 80, -- Define a largura do buffer (pode ajustar para mais ou menos)
        options = {
          number = false, -- Esconde a numeração das linhas
          relativenumber = false,
        },
      },
    })
  end,
}
