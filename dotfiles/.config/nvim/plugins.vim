let s:darwin = has('mac')

call plug#begin('~/.config/nvim/plugins/')
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'altercation/vim-colors-solarized'
  Plug 'dag/vim-fish', { 'for': 'fish' }
  Plug 'elzr/vim-json', { 'for': 'json' }
  Plug 'groenewege/vim-less', { 'for': 'less' }
  Plug 'honza/dockerfile.vim'
  if s:darwin
    Plug '/usr/local/opt/fzf'
  endif
  Plug 'junegunn/fzf.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'rust-lang/rust.vim'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()
