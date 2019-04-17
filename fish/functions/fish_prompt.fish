set fish_prompt_pwd_dir_length 0
set __fish_git_prompt_shorten_branch_len 32

function fish_prompt
  set_color --dim normal
  printf "[%s %s%s]" (date +"%T") (prompt_pwd) (__fish_git_prompt)

  switch $fish_bind_mode
      case default
          set_color --bold "0d61ac"
          printf "~ "
      case replace-one
          set_color --bold "fdae66"
          printf "X "
      case visual
          set_color --bold "870000"
          printf "> "
      case "*"
          set_color --bold "499900"
          printf "\$ "
  end

  set_color normal
end

