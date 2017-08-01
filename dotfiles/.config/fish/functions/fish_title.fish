function fish_title --description 'Set terminal title'
    if [ $_ = 'fish' ]
        echo (prompt_pwd)
    else
        echo $_
    end
end
