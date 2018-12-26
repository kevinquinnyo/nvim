" order sometimes matters here, be aware of that
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/filetypes.vim
source $HOME/.config/nvim/plugins/ultisnips.vim
source $HOME/.config/nvim/plugins/ncm2.vim
source $HOME/.config/nvim/plugins/phpactor.vim
source $HOME/.config/nvim/plugins/ctrlp.vim
source $HOME/.config/nvim/plugins/nerdtree.vim
source $HOME/.config/nvim/plugins/vim-test.vim
source $HOME/.config/nvim/plugins/ale.vim

" Misc plugin config - no need for a dedicated file right now for these:

" vim-signify
" only look for git (not vcs, mercurial, etc)
let g:signify_vcs_list = ['git']

" airline (status bar)
let g:airline_powerline_fonts = 1

" pdv (docblock generation)
let g:pdv_template_dir = $HOME ."/.vim/pdv/templates_snip"
nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
