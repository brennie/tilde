source /usr/share/fish/completions/git.fish

complete -c tig -f -a '(__fish_git_branches)' -d 'git branch'
complete -c tig -f -a '(__fish_git_tags)' -d 'git tag'
