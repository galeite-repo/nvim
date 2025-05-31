#!/bin/bash

# 🚀 Script para configurar um terminal bonito no Ubuntu Server

echo "🔄 Atualizando pacotes..."
sudo apt update && sudo apt upgrade -y

echo "📦 Instalando pacotes essenciais..."
sudo apt install -y \
  git \
  zsh \
  tmux \
  htop \
  ncdu \
  ripgrep \
  fzf \
  curl \
  neovim

echo "✅ Pacotes instalados com sucesso!"

# 🔹 Trocar o Shell para Zsh
echo "⚙️ Configurando Zsh como padrão..."
chsh -s $(which zsh)

# 🔹 Instalar Oh My Zsh
echo "💾 Instalando Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "⚠️ Oh My Zsh já está instalado! Pulando..."
fi


# Baixando tema powerlevel10k

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k


# 🔹 Configurar tema Power Level 10k  no Zsh
echo "🎨 Configurando tema Power level 10k no Zsh..."
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k/powerlevel10k"/' ~/.zshrc

# 🔹 Configurar alias para `ls` colorido
echo "alias ls='ls --color=auto'" >> ~/.zshrc

# 🔹 Instalar Starship (Prompt Moderno)
echo "✨ Instalando Starship..."
curl -sS https://starship.rs/install.sh | sh

# 🔹 Configurar Starship no Zsh
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# 🔹 Aplicar mudanças
echo "🔄 Aplicando configurações..."
source ~/.zshrc

echo "✅ Instalação concluída! Reinicie o terminal ou digite 'zsh' para aplicar as mudanças."

