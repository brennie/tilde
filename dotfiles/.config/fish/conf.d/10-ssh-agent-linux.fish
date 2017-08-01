if begin; test (uname) = 'Linux'; and begin; test -z "$SSH_AUTH_SOCK"; or test -S "$SSH_AUTH_SOCK"; end; end
    set -Ux SSH_AUTH_SOCK (systemctl --user show-environment | \
                           grep SSH_AUTH_SOCK | \
                           sed -E 's/^.+=//')
end
