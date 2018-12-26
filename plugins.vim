" Plugins via nvim
call plug#begin('~/nvim/plugged')
Plug 'ludovicchabant/vim-gutentags'     " Automatic ctags
Plug 'SirVer/ultisnips'                 " Snippets. Also a dependency of pdv (the way we have it configured)
Plug 'honza/vim-snippets'               " Large snippets library for multiple languages
Plug 'tobyS/vmustache'                  " Templating system (required for pdv)
Plug 'tobyS/pdv'                        " Auto generating php docblocks
Plug 'vim-airline/vim-airline'          " Vim status line
Plug 'vim-airline/vim-airline-themes'   " Vim status line themes
Plug 'StanAngeloff/php.vim'             " Improved syntax highlighting for php
Plug 'ncm2/ncm2'                        " Autocompletion engine
Plug 'ncm2/ncm2-bufword'                " Basic word completion? testing
Plug 'roxma/nvim-yarp'                  " Yet Another Remote Plugin Framework (dependency of ncm2)
Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'} " PHP introspection and refactor tools
Plug 'phpactor/ncm2-phpactor'           " Phpactor integration for ncm2 (autocomplete)
Plug 'morhetz/gruvbox'                  " Vim colorscheme
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy file search and more
Plug 'tpope/vim-fugitive'               " Git integration
Plug 'mhinz/vim-signify'                " Git integration inline
Plug 'stephpy/vim-php-cs-fixer'         " Coding standards fixer
Plug 'janko-m/vim-test'                 " Run unit tests
Plug 'tpope/vim-dispatch'               " Dispatch tasks (only using it for unit tests)
Plug 'bling/vim-bufferline'             " Show buffers in status bar
Plug 'w0rp/ale'                         " Asynchronous code linter and anylysis
Plug 'scrooloose/nerdtree'              " File/directory Tree explorer
call plug#end()
