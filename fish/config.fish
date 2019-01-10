set -x EDITOR "vim"
set -x VISUAL "vim"
set -x LESS "-R"
set -x FZF_DEFAULT_COMMAND 'rg --files'

set fish_user_paths $HOME/bin

set fish_greeting ""

alias be "bundle exec"
alias ls "ls -FG"
alias pag "ag --pager='less -R'"

fish_hybrid_key_bindings

if test -e ~/.iterm2_shell_integration.fish
  source ~/.iterm2_shell_integration.fish
end

if status --is-interactive
  source (rbenv init -|psub)
end

if test -e ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end

