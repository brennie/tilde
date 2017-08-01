complete -c git -n '__fish_git_needs_command' -f -a 'rebase-here' -d 'Rebase a branch here'
complete -c git -n '__fish_git_using_command rebase-here' -f -a '(__fish_git_branches)' -d 'git branch'

complete -c git -n '__fish_git_needs_command' -f -a 'rebase-this' -d 'Rebase this branch elsewhere'
complete -c git -n '__fish_git_using_command rebase-this' -f -a '(__fish_git_branches)' -d 'git branch'
complete -c git -n '__fish_git_using_command rebase-this' -f -a '(__fish_git_tags)' -d 'git tag'

complete -c git -n '__fish_git_needs_command' -f -a 'reset-here' -d 'Reset a branch here'
complete -c git -n '__fish_git_using_command reset-here' -f -a '(__fish_git_branches)' -d 'git branch'
