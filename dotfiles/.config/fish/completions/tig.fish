if test (uname) = 'Darwin'
    source /usr/local/opt/fish/share/fish/completions/git.fish
else
    source /usr/share/fish/completions/git.fish
end

complete -c tig -f -a '(__fish_git_branches)' -d 'git branch'
complete -c tig -f -a '(__fish_git_tags)' -d 'git tag'
