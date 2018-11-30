let s:darwin = has('mac')

function! s:exists(path)
  return !empty(glob(a:path))
endfunction

if !s:darwin
  if s:exists('/usr/share/vim/vimfiles/plugin/fzf.vim')
    " Arch Linux installs fzf.vim here.
    source share/vim/vimfiles/plugin/fzf.vim
  elseif s:exists('/usr/share/doc/fzf/examples/fzf.vim')
    " Debian package installs fzf.vim here.
    source /usr/share/doc/fzf/examples/fzf.vim
  end
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

" Using `autocmd FileType someft` ... won't execute when creating a split, so
" we need a workaround.
"
" See <http://vim.wikia.com/wiki/Detect_window_creation_with_WinEnter> for more
" details.
augroup FileTypes
  autocmd!

  " WinEnter doesn't trigger for the first window. So we specifically set the
  " w:created when we enter vim.
  " Then we register an autocmd to set up w:created in each new window.
  autocmd VimEnter * let w:created=1
  autocmd VimEnter * autocmd WinEnter * let w:created=1

  " Set up per-filetype settiings when new windows are created.
  autocmd WinEnter * if !exists('w:created') | call s:handleFt(&ft) | endif

  " And when we change filetypes.
  autocmd FileType * call s:handleFt(&ft)
augroup END


" Filetype-specific settings.
function s:handleFt(filetype)
  if exists('w:matchadd_id')
     call matchdelete(w:matchadd_id)
  endif

  if a:filetype == 'python'
    let l:col = 79
  elseif a:filetype == 'javascript'
    let l:col = 80
  elseif a:filetype == 'git'
    let l:col = 72
  elseif a:filetype == 'terraform'
    setlocal commentstring=#%s
  elseif a:filetype == 'go'
    setlocal ts=4 sw=4 et
  endif

  if exists('l:col')
    let l:colfmt = printf('\%%>%dv.\+', l:col)
    let w:matchadd_id = matchadd('ColorColumn', l:colfmt, 100)
  endif
endfunction

let g:terraform_align = 1

augroup PostCSS
  autocmd!
  autocmd BufNewFile,BufRead *.pcss setlocal ft=scss
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
