POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator)
export PATH="/usr/local/bin:$PATH"
# zsh, oh-my-zsh, antigen setup for mac
# on mac you need to install:
# brew install zsh antigen zsh-completions
# find more information @ https://meabed.com/zsh-oh-my-zsh-up-and-running

source /usr/local/share/antigen/antigen.zsh

export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true
export SUBLIME=subl
export EDITOR="$SUBLIME -w"
export VISUAL=$EDITOR
export TERM="xterm-256color"
export PAGER='less'
export LESS='-giAMR'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load local sh, export, for example export GOPATH, export JAVA_HOME, export ANDROID_SDK, etc...
[[ -s "$HOME/.export" ]] && source "$HOME/.export"

# Load the oh-my-zsh's library
antigen use oh-my-zsh
antigen bundle z

# bundle antigen zsh plugins @ https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins
antigen bundles <<EOBUNDLES
	common-aliases
	history
	git
	docker
	zsh_reload
	zsh-users/zsh-completions
	zsh-users/zsh-autosuggestions
  unixorn/autoupdate-antigen.zshplugin
EOBUNDLES

# Load the theme @ https://github.com/robbyrussell/oh-my-zsh/tree/master/themes/
# Load the theme
# simple and fast
# antigen theme steeef
antigen theme bhilburn/powerlevel9k powerlevel9k
# cool but slow
# antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# syntax highlighting must come below the bundle to set the correct paths/variables with history search
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

# Tell antigen that you're done
antigen apply

# bind keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Extra zsh variables - history, auto-completion etc...
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=10240000               # big history
SAVEHIST=10240000               # big history
LISTMAX=999999


# auto-completion with selection / menu / error correction / cache / etc...
zstyle ':completion:*:*:*:*:*' menu select

zstyle ':completion:*' verbose true
zstyle ':completion:*' menu yes select=1
zstyle ':completion:*' substitute 0
zstyle ':completion:*' max-errors 2 not-numeric
zstyle ':completion:*' original true
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' file-sort links reverse
zstyle ':completion:*:commands' rehash true
zstyle ':completion:*:functions' ignored-patterns '_*'

zstyle ':completion:*' completer _expand _complete _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' matcher-list '' '+m:{a-z}={A-Z} r:|[._-]=* r:|=*' '' 'l:|=* r:|=*'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)*==36=36}:${(s.:.)LS_COLORS}")';

zstyle ':filter-select:highlight' matched fg=red
zstyle ':filter-select' max-lines 1000
zstyle ':filter-select' rotate-list yes
zstyle ':filter-select' case-insensitive yes # enable case-insensitive search

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

eval "$(direnv hook zsh)"