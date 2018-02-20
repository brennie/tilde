let s:darwin = has('mac')

if !s:darwin
  source /usr/share/vim/vimfiles/plugin/fzf.vim
end

source ~/.config/nvim/plugins.vim

filetype plugin indent on
syntax on

set termguicolors
set bg=dark
colorscheme NeoSolarized
highlight colorcolumn guibg=#dc322f

let mapleader=","

set laststatus=2  " Always show airline.

" Allow backspacing over autoindents, end of lines, and start of input.
set backspace=indent,eol,start

set modeline       " Enable modelines.
set modelines=5    " Search 5 lines for a modeline.
set number         " Show line numbers.
set relativenumber " Show relative line numbers
set ruler          " Show position in file and line.
set scrolloff=10   " Show atleast 10 lines above & below cursor if possible.
set wildmenu       " Visual autocomplete for commands.
set nojoinspaces   " Don't insert two spaces after punctuation when joining.

set nobackup        " No automatic backups.
set fileformat=unix " Force \n line endings.
set hidden          " Allow switching from hidden buffers.

set foldlevelstart=99 " Do not automatically close folds.

set mouse +=a " Enable mouse support.

set undofile
set undodir=~/.vim/undo

let NERDTreeIgnore = [ '\.py[co]$', '\.o$', '^\.DS_Store$', '^__pycache__$', '\.egg-info$', '^node_modules$', ]

let g:python_host_prog = expand('~/.virtualenvs/neovim/bin/python')
let g:python3_host_prog = expand('~/.virtualenvs/neovim3/bin/python')
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands= {
 \ 'python': [expand('~/.virtualenvs/neovim3/bin/pyls'),],
 \ 'rust': ['rustup', 'run', 'nightly', 'rls',]
 \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_trace = 'verbose'

let g:SimpylFold_docstring_preview = 1

" Automatically call nohlsearch after a non-search related motion.
let g:incsearch#auto_nohlsearch = 1

augroup lint
  autocmd!
  autocmd BufWritePre * StripWhitespace
augroup END

augroup Python
  autocmd!
  autocmd FileType python call matchadd('ColorColumn', '\%>79v.\+', 100)
augroup END

augroup JavaScript
  autocmd!
  autocmd FileType javascript call matchadd('ColorColumn', '\%>80v.\+', 100)
augroup END

augroup Git
  autocmd!
  autocmd FileType gitcommit call matchadd('ColorColumn', '\%>72v.\+', 100)
augroup END

augroup PostCSS
  autocmd!
  autocmd BufNewFile,BufRead *.pcss set ft=scss
augroup END

if s:darwin
  " Keybindings to make nvim play nice on macOS.
  nnoremap <C-a> <Home>
  nnoremap <C-e> <End>
  inoremap <C-a> <Home>
  inoremap <C-e> <End>
end

" Map [COUNT]<C-j> to insert COUNT blank lines below.
nnoremap <silent> <C-j> :<C-u>silent call append(line('.'), repeat([''], v:count1))<CR>

" Map [COUNT]<C-k> to insert COUNT blank lines above.
nnoremap <silent> <C-k> :<C-u>silent call append(line('.')-1, repeat([''], v:count1))<CR>

" Map <C-p> to fzf.vim file search.
nnoremap <silent> <C-p> :Files<CR>

" Use <A-{hjkl}> to move around windows.
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" The same for terminal mode.
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Use <C-k>b to open/close NERDtree
nnoremap <silent> <C-k>b :NERDTreeToggle<CR>

" Use <C-k>u to open/close mundo's undo tree
nnoremap <silent> <C-k>u :MundoToggle<CR>

" Use <leader>x to close buffers
nnoremap <silent> <leader>x :BW<cr>

" Use <leader><cr> to list buffers with fzf
nnoremap <silent> <leader><CR> :Buffers<CR>

" Map gd to go to defintion.
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <C-o> :call LanguageClient_textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <C-f> :call LanguageClient_textDocument_formatting()<CR>

" Use incsearch.vim over builtin search.
nmap / <Plug>(incsearch-forward)
nmap ? <Plug>(incsearch-backward)
