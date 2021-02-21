#! /bin/bash
set -e

cd "$(dirname "${BASH_SOURCE[0]}")";

if [[ "$OSTYPE" == "darwin"* ]]; then
echo "📦 Installing packages using brew..."
brew install bat
brew install exa
brew install romkatv/powerlevel10k/powerlevel10k
brew install zsh-autosuggestions
elif [ "$OS_NAME" == "Linux" ] && [ -e "/etc/lsb-release" ]; then
echo "📦 Installing packages using apt..."
apt install -y bat
apt install -y exa
apt install -y romkatv/powerlevel10k/powerlevel10k
apt install -y zsh-autosuggestions
fi

echo "🔗 Linking dotfiles..."

ln -sf "$(pwd)/.zshrc" "$HOME/.zshrc" 
ln -sf "$(pwd)/.p10k.zsh" "$HOME/.p10k.zsh" 

echo "✅ Done!"