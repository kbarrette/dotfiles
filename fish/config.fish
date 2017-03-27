set -x EDITOR "vim"
set -x VISUAL "vim"
set -x LESS "-R"

alias be "bundle exec"
alias ls "ls -FG"
alias pag "ag --pager='less -R'"

source ~/.iterm2_shell_integration.fish

fish_hybrid_key_bindings

status --is-interactive; and source (rbenv init -|psub)

set fish_user_paths $HOME/bin /usr/local/sbin
