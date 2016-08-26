# Path to your oh-my-zsh installation.
export ZSH=/home/dex/.oh-my-zsh
ZSH_THEME="intheloop"
#ZSH_THEME="random"
HYPHEN_INSENSITIVE="true"
DEFAULT_USER='dex'
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
ISABLE_UNTRACKED_FILES_DIRTY="true"
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git archlinux python scrapy)
alias vihelp="less ~/.oh-my-zsh/plugins/vi-mode/README.md"

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:home/reb/bin:/home/dex/.local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias alphabet='echo "abcde\nfghij\nklmno\npqrst\nuvwxyz"'
alias wpd='git push && shub deploy'
alias wpdd='git push && shub deploy && shub deploy prod'
alias ka='killall -s KILL -v '
alias gs='git status'
alias song='echo "$1" >> ~/music/songs.txt'
alias xclip='xclip -selection c'
alias dlsong='youtube-dl --extract-audio --audio-format mp3 -o "~/music/%(title)s.%(ext)s"'
alias cal='cal -m'
alias enlt='trans :lt -brief '
alias eeen='trans est:en -brief '
alias enee='trans :est -brief '
alias lten='trans lt:en -brief '
export PATH=~/bin/:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
# Scrapinghub api keys
source ~/.api_keys
export PYTHONDONTWRITEBYTECODE=True
#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon
# Preffered applications
export EDITOR='vim'
export BROWSER='firefox'
export VISUAL='vim'

doge -mh 20 #enable doge on startup
