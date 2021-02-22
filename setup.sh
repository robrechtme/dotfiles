#! /bin/bash
set -e

if [ `whoami` != 'root' ]
  then
    echo "You must be root to do this."
    exit
fi

cd "$(dirname "${BASH_SOURCE[0]}")";

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "📦 Installing packages using brew..."
  brew install bat
  brew install exa
  brew install romkatv/powerlevel10k/powerlevel10k
  brew install zsh-autosuggestions
elif grep -q "debian" /etc/os-release; then
  echo "📦 Installing packages using apt..."
  apt udate
  apt install -y bat
  apt install -y exa
  apt install -y romkatv/powerlevel10k/powerlevel10k
  apt install -y zsh-autosuggestions
fi

echo "🔗 Linking dotfiles..."

FILES_TO_SYMLINK=".zshrc .p10k.zsh .gitconfig"
for i in ${FILES_TO_SYMLINK[@]}; do
  sourceFile="$(pwd)/$i"
  targetFile="$HOME/$i"
  ln -fs "$sourceFile" "$targetFile"
  echo "$targetFile → $sourceFile"
done

echo "✅ Done!"