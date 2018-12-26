syntax on               " Syntax highlighting
set hidden              " Allow files to remain open without saving
set number nu           " Line numbers
set autoindent          " Auto indenting
set smartindent         " Smart indenting
"set relativenumber     " Line numbers count away from current position
" Not sure how you feel about this one? Quickly toggle:
" :set rnu
" :set !rnu

" Set some defaults for spacing (4 spaces)
" These can be overriden in $HOME/.config/filetypes.vim
set tabstop=4           " Tab width
set softtabstop=4       " Soft tab width
set shiftwidth=4        " Shift width
set expandtab           " Use spaces instead of tabs

" Use the filetype plugins
" :help filetypes
" Note that we override this for some files with `$HOME/.config/nvim/filetypes`
filetype plugin indent on

" so many colors
set t_Co=256

" Cycle through buffers quickly
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" quick edit of this file
map <Leader>ve :tabnew ~/.config/nvim/init.vim<CR>

" multiple vim instance yank/paste tmp file hack
vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>

" This colorscheme is provided by https://github.com/morhetz/gruvbox
" see $HOME/.config/nvim/plugins.vim
colorscheme gruvbox
set background=dark

" I Hold shift for too long, "fix" that problem:
cmap W<CR> w<CR>
cmap Wq<CR> wq<CR>

" hardmode - disable arrow keys
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
