return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  config = function()
    require("gitblame").setup({
      enabled = true, -- Ativar automaticamente
      message_template = " <author> • <summary> • <date>",
    })
  end,
}
