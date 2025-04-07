sudo apt update

sudo apt install git
sudo apt install curl

# Links
ln -s ~/dotfiles/zshell/.zshrc ~/.zshrc
ln -s ~/dotfiles/git/git-configs ~/.gitconfig
ln -s ~/dotfiles/Code/User/settings.json ~/.config/Code/User/profiles/-148156c3/settings.json
ln -s ~/dotfiles/Code/User/keybindings.json ~/.config/Code/User/profiles/-148156c3/keybindings.json
ln -s ~/dotfiles/i3/config ~/.config/i3/config 


# Node 20
# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 20

# Instal zsh
sudo apt install zsh
chsh -s $(which zsh) # Change default shell to zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## spaceship theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
rm ~/.zshrc
ln -s ~/dotfiles/zshell/.zshrc ~/.zshrc
source ~/.zshrc


# Random dependencies
sudo apt install x-clip
sudo apt install gcc
sudo apt install build-essential
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
$ sudo dpkg -i ripgrep_14.1.0-1_amd64.deb

# bat
sudo apt install bat
mkdir -p ~/.local/bin\nln -s /usr/bin/batcat ~/.local/bin/bat

# Fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Neovim
sudo apt-get install neovim
# Astronvim
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
git clone https://github.com/guhenrique007/astronvim_my_template ~/.config/nvim

# Tmux
sudo apt install tmux
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

# I3
sudo apt install i3
ln -s ~/dotfiles/i3/config ~/.config/i3


# Links
ln -s ~/dotfiles/git/git-configs ~/.gitconfig
# ln -s ~/dotfiles/Code/User/settings.json ~/.config/Code/User/profiles/-148156c3/settings.json
# ln -s ~/dotfiles/Code/User/keybindings.json ~/.config/Code/User/profiles/-148156c3/keybindings.json


