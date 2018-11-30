if begin; test (uname) = 'Linux'; and begin; test -z "$SSH_AUTH_SOCK"; or not test -S "$SSH_AUTH_SOCK"; end; end
    set -Ux SSH_AUTH_SOCK (systemctl --user show-environment | \
                           grep SSH_AUTH_SOCK | \
                           sed -E 's/^.+=//')
end

if test -z "$_FISH_SHELL_ONCE"
    ssh-add </dev/null

    if test -e /usr/bin/ksshaskpass
        set -x SSH_ASKPASS /usr/bin/ksshaskpass
    end
end
