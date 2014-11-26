ulimit -n 2048

# Don't use ^S for XON
stty -ixon

source ~/bin/git-completion.bash
source ~/bin/git-prompt.sh

export CLICOLOR=1
export EDITOR='vim'
export VISUAL='vim'
export HISTFILESIZE=10000
export HISTSIZE=10000
export LESS=' -R '
export PATH="~/bin:/usr/local/sbin:$PATH"
export PS1='[\D{%T} \w$(__git_ps1 " (%s)")]\$ '
export RBENV_ROOT=/usr/local/var/rbenv

alias be='bundle exec'
alias ls='ls -F'
alias pag='ag --pager="less -R"'
alias view='vim -u ~/.vim/pager.vimrc'
alias nv='nvim'

eval "$(rbenv init -)"
