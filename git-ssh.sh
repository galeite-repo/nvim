#!/bin/bash

# 🚀 Script para configurar Git e SSH no GitHub automaticamente

# 1️⃣ Solicita Nome e Email do usuário
read -p "Digite seu Nome (para o Git): " GIT_NAME
read -p "Digite seu Email (para o Git): " GIT_EMAIL

# 2️⃣ Configura Nome e Email no Git
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

echo "✅ Nome e Email configurados no Git."

# 3️⃣ Define o caminho da chave SSH
SSH_KEY="$HOME/.ssh/id_rsa"

# 4️⃣ Gera a chave SSH (se não existir)
if [[ -f "$SSH_KEY" ]]; then
  echo "⚠️ Chave SSH já existe! Pulando geração..."
else
  echo "🔑 Gerando nova chave SSH..."
  ssh-keygen -t rsa -b 4096 -C "$GIT_EMAIL" -f "$SSH_KEY" -N ""
  echo "✅ Chave SSH gerada em $SSH_KEY"
fi

# 5️⃣ Ativa o ssh-agent
eval "$(ssh-agent -s)"

# 6️⃣ Adiciona a chave SSH ao ssh-agent
ssh-add "$SSH_KEY"
echo "✅ Chave SSH adicionada ao ssh-agent."

# 7️⃣ Configura o Git para usar a chave SSH globalmente
git config --global core.sshCommand "ssh -i $SSH_KEY"
echo "✅ Git configurado para usar a chave SSH."

# 8️⃣ Copia a chave para o clipboard (Linux: xclip ou xsel)
if command -v xclip &>/dev/null; then
  xclip -selection clipboard <"$SSH_KEY.pub"
  echo "📋 Chave pública copiada para a área de transferência! ✅"
elif command -v xsel &>/dev/null; then
  xsel --clipboard <"$SSH_KEY.pub"
  echo "📋 Chave pública copiada para a área de transferência! ✅"
else
  echo "⚠️ Nenhum comando de cópia encontrado. Copie manualmente com:"
  echo "cat $SSH_KEY.pub"
fi

# 9️⃣ Exibe instruções finais para adicionar ao GitHub
echo ""
echo "🚀 Agora, adicione sua chave SSH ao GitHub:"
echo "1️⃣ Acesse: https://github.com/settings/keys"
echo "2️⃣ Clique em 'New SSH Key'"
echo "3️⃣ Cole a chave copiada"
echo "4️⃣ Salve e teste com: ssh -T git@github.com"

echo "✅ Configuração concluída!"
