function fish_user_key_bindings --description 'Set keybindings'
    # Bind Ctrl+f to forward one word.
    bind \cf forward-word
    
    # Bind Ctrl+b to backward one word.
    bind \cb backward-word
    
    fzf_key_bindings
end

