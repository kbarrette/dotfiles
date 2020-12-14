set -x EDITOR "vim"
set -x VISUAL "vim"
set -x LESS "-R"
set -x FZF_DEFAULT_COMMAND 'rg --files'
set -x PATH $HOME/bin $PATH

set fish_greeting ""

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

starship init fish | source
