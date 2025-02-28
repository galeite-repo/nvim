return {
  "tpope/vim-fugitive",
  cmd = { "Git", "Gdiffsplit", "Gvdiffsplit", "Gblame", "Gpush", "Gpull" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "Abrir status do Git" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Abrir Git Blame" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Fazer commit" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Fazer push" },
  },
}
