#!/bin/bash

# 🚀 Script para instalar LazyVim e todas as dependências no Linux

echo "🔄 Atualizando pacotes..."
sudo apt update && sudo apt upgrade -y

echo "📦 Instalando dependências essenciais..."
sudo apt install -y \
  git \
  neovim \
  gcc \
  g++ \
  make \
  cmake \
  unzip \
  curl \
  ripgrep \
  fd-find \
  python3 \
  python3-pip

echo "✅ Dependências instaladas!"

# 🔹 Instalando NVM (Node Version Manager)
echo "📦 Instalando NVM..."
if [ ! -d "$HOME/.nvm" ]; then
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
  echo "✅ NVM instalado!"
else
  echo "⚠️ NVM já está instalado! Pulando..."
fi

# 🔹 Carregar NVM sem precisar reiniciar a sessão
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

# 🔹 Instalando a versão mais recente do Node.js
echo "📦 Instalando Node.js via NVM..."
nvm install --lts
nvm use --lts
nvm alias default lts/*

echo "✅ Node.js instalado! Versão: $(node -v)"

# 🔹 Instalando suporte a Python para Neovim
echo "🐍 Configurando Python para Neovim..."
pip3 install --user --upgrade pynvim

# 🔹 Instalando LazyVim
echo "🛠️ Configurando LazyVim..."
if [ ! -d "$HOME/.config/nvim" ]; then
  git clone https://github.com/LazyVim/starter ~/.config/nvim
else
  echo "⚠️ Diretório ~/.config/nvim já existe! Pulando instalação..."
fi

echo "📌 Para iniciar o LazyVim, execute: nvim"

echo "✅ Instalação concluída!"

