function fish_prompt
  set prompt_color "white"
  set prompt_sign "\$"
  set -g fish_prompt_pwd_dir_length 0

  if test "$fish_key_bindings" = "fish_vi_key_bindings"
      or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
      switch $fish_bind_mode
          case default
              set prompt_color "0d61ac"
              set prompt_sign "~"
          case insert
              set prompt_color "499900"
              set prompt_sign "\$"
          case replace-one
              set prompt_color "fdae66"
              set prompt_sign "X"
          case visual
              set prompt_color "870000"
              set prompt_sign ">"
      end
  end

  printf "[%s %s%s]" (date +"%T") (prompt_pwd) (__fish_git_prompt)
  set_color --bold $prompt_color
  printf "%s " $prompt_sign
  set_color normal
end

