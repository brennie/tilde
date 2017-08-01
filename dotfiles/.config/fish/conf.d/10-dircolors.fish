if test -z "$_FISH_SHELL_ONCE"
    eval (dircolors -c ~/.dircolors | sed -E 's/^setenv/set -x/')
end
