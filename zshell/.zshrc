# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/gustavo/.oh-my-zsh"
export ZSH_CUSTOM="/home/gustavo/.oh-my-zsh/custom"
export PATH="$PATH:/opt/nvim-linux64/bin"

export ANDROID_HOME=$HOME/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_SDK=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_SDK/emulator
export PATH=$PATH:$ANDROID_SDK/tools
export PATH=$PATH:$ANDROID_SDK/tools/bin
export PATH=$PATH:$ANDROID_SDK/platform-tools
export DOCKER_HOST=127.0.0.1:4243

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# zoxide
eval "$(zoxide init zsh)"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions asdf gitfast)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"




alias home="cd ~"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias astroconfig="cd ~/.config/nvim && nvim"
alias zshconfig="nvim ~/dotfiles/zshell/.zshrc"
alias safemob="cd ~/work/safeLegacy-Mobile/"
alias safeback="cd ~/work/safeLegacy-backend/"
alias editvsvim="nvim ~/.config/Code/User/settings.json"
alias pasteclip="xclip -o"
alias dockerls="docker container ls -a --format 'table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.Status}}'"
alias dockerstatus="docker container stats --no-stream"
alias dockerps="docker ps -a --format 'table {{.ID}}\\t{{.Image}}\\t{{.Status}}'"
alias gitedit="git config --global --edit"
alias polybarinit="bash ~/.config/polybar/launch.sh --blocks"
alias i3edit="nvim .config/i3/config"
alias fm="autorandr --load mobile"
alias sm="autorandr --load docked"
alias lvim=".local/bin/lvim"
alias spot="/home/gustavo/.cargo/bin/spotify_player"
alias kitty="/home/gustavo/.local/kitty.app/bin/kitty"
alias spotifyd="~/spotifyd/target/release/spotifyd --no-daemon"
alias tempo="curl wttr.in"
alias ls-alias="cat ~/.zshrc | grep alias"


# colmeia
alias colmeia-start="sudo docker start 19c8f52bd8d7 && sudo openvpn ~/gustavo.lima.ovpn"
alias colmeia="~/colmeia/scripts/script.sh"
alias colmeia-notes="cd ~/Documents/colmeia-notes"


#alias ncdu="ncdu"
#alias ranger="ranger"

SPACESHIP_PROMPT_ORDER=(
  user
  dir
  host
  git
  hg
  exec_time
  line_sep
  # vi_mode
  jobs
  exit_code
  char
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_GIT_SYMBOL="Ḃ"

source ~/.nvm/nvm.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# This conflicts with git colors or any other
source /home/gustavo/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# python
source .venv/bin/activate


# Created by `pipx` on 2024-06-18 14:45:59
export PATH="$PATH:/home/gustavo/.local/bin"


# Load Angular CLI autocompletion.
source <(ng completion script)

# Load fzf
source <(fzf --zsh)


PATH=~/.console-ninja/.bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
