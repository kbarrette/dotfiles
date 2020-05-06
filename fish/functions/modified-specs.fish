function modified-specs
  set -l files (git status --porcelain | string sub -s4 | string replace --regex '^app' 'spec' | string replace --regex '(?<!_spec).rb' '_spec.rb' | grep '^spec' | grep -v '^spec/fixtures' | uniq | while read -la line; if test -e $line; echo $line; end; end | string join ' ')

  if test -n "$files"
    echo $files
    eval "bundle exec rspec $files"
  end
end

