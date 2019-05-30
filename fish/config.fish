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

function modified-specs
  set -l files (git status --porcelain | string sub -s4 | string replace --regex '^app' 'spec' | string replace --regex '(?<!_spec).rb' '_spec.rb' | grep '^spec' | while read -la line; if test -e $line; echo $line; end; end | string join ' ')

  if test -n "$files"
    echo $files
    eval "bundle exec rspec $files"
  end
end

