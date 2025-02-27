-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options before
--
vim.cmd([[set guicursor=]])
vim.opt.relativenumber = false
vim.opt.number = true

vim.diagnostic.config({
  virtual_text = true, -- Mostra os erros dentro do código
  signs = true, -- Mostra ícones na lateral
  underline = true, -- Sublinha os erros
  update_in_insert = false, -- Não atualizar enquanto digita
})
vim.g.colorscheme = "nordfox"
