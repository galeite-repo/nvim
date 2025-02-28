return {
  "tpope/vim-fugitive",
  cmd = { "Git" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status" },
    { "<leader>ga", "<cmd>Git add .<cr>", desc = "Git Add All" },
    { "<leader>gA", "<cmd>Git add %<cr>", desc = "Git Add Arquivo Atual" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git Commit" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git Push" },
    { "<leader>gP", "<cmd>Git pull<cr>", desc = "Git Pull" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git Blame" },
    { "<leader>gl", "<cmd>Git log<cr>", desc = "Git Log" },
    { "<leader>gd", "<cmd>Git diff<cr>", desc = "Git Diff" },
    { "<leader>gr", "<cmd>Git reset HEAD<cr>", desc = "Git Reset" },
    { "<leader>gnb", "<cmd>Git checkout -b ", desc = "Criar Nova Branch" },
    { "<leader>gbx", "<cmd>Git checkout ", desc = "Trocar de Branch" },
  },
}
