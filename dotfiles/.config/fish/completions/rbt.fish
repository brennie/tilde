function __is_rbt_command
    set cmd (commandline -opc)
    if [ (count $cmd) -gt 1 ]
        if [ $argv[1] = $cmd[2] ]
            return 0
        end
    end

    return 1
end

function __is_git
    git status ^/dev/null >/dev/null
    return $status
end

complete -c rbt -n '__is_rbt_command land; and __is_git' -f -a '(git branch | cut -c 3-)' -d 'git branch'
