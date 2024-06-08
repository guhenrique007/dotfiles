sudo apt update

sudo apt install git
sudo apt install curl

# Git
ln -s ~/dotfiles/git/git-configs ~/.gitconfig

# Instal zsh
sudo apt install zsh
chsh -s $(which zsh) # Change default shell to zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## spaceship theme
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ln -s ~/dotfiles/zshell/.zshrc ~/.zshrc

# Random dependencies
sudo apt install x-clip

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
