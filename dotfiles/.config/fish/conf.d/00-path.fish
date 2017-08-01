if test -z "$_FISH_SHELL_ONCE"
    set -gx PATH ~/bin \
                 ~/.local/bin \
                 ~/.cargo/bin \
                 $PATH
end
