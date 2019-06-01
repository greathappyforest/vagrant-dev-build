git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.local/share/fonts/
mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
# add autojump
sudo apt-get install -y autojump
git clone https://github.com/joelthelion/autojump.git /tmp/autojump
cd /tmp/autojump
./install.py
echo "[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && source ~/.autojump/etc/profile.d/autojump.sh" >> ~/.zshrc
cd ..
rm -rf /tmp/autojump
# save history
echo "Log out of your session and login again."
echo "export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt EXTENDED_HISTORY" >> ~/.zshrc
sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
sudo sed -i 's/plugins=(git)/plugins=(git ruby bower bundler docker gem git-extras mvn npm python redis-cli autojump)/g' ~/.zshrc
# if not work, run without sudo and re-login
sudo chsh -s $(which zsh)
