sudo apt-get update
sudo apt-get install -y zsh git curl
chsh -s $(which zsh)
sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
