if begin; test -z "$_FISH_SHELL_ONCE"; and test (uname) = 'Darwin'; end
    set -gx PATH /usr/local/opt/coreutils/libexec/gnubin \
                 /usr/local/opt/gnu-tar/libexec/gnubin \
                 ~/Library/Python/2.7/bin \
                 ~/Library/Python/3.6/bin \
                 /usr/local/bin \
                 /usr/local/opt/python/bin \
                 $PATH

    # Update MANPATH to use the manpages from GNU before the defaults.
    #
    # By default, MANPATH is not set on macOS so we *need* to include
    # /usr/share/man or we won't have access to those manpages -- only the GNU
    # ones.
    set -gx MANPATH /usr/local/share/man/ \
                    /usr/share/man \
                    $MANPATH
end
