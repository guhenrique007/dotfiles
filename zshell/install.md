- Install zsh
sudo apt install zsh

- Install oh my zsh
``sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"``

- Theme
https://github.com/spaceship-prompt/spaceship-prompt

``git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1``
  ``ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"``

Plugins:
``git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-
my-zsh/custom}/plugins/zsh-autosuggestions``

``git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh- my-zsh/custom}/plugins/zsh-syntax-highlighting``

https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md



