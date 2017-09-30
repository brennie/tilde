if test -z "$_FISH_SHELL_ONCE"
    if test -z "$TERM"
        set -x TERM xterm-256color
        set -x UNSET_TERM 1
    end

    eval (dircolors -c ~/.dircolors | sed -E 's/^setenv/set -gx/')

    if test $UNSET_TERM -eq 1
        set -e UNSET_TERM
        set -e TERM
    end
end
