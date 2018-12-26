" autocmd - settings based on file types.

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" Map .twig files as jinja templates
au BufRead,BufNewFile *.twig,*.tpl set ft=htmljinja

" Map *.coffee to coffee type
au BufRead,BufNewFile *.coffee set ft=coffee

" Highlight JSON & es6 like Javascript
au BufNewFile,BufRead {*.json,*.es6} set ft=javascript

" hbs and mustache files.
au BufRead,BufNewFile {*.mustache,*.hbs} set ft=mustache

" Jenkinsfile are groovy
au BufRead,BufNewFile Jenkinsfile set ft=groovy

" Lector uses custom file types, but markdown contents.
au BufNewFile,BufRead {*.lr} set ft=markdown

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python setl softtabstop=4 shiftwidth=4 tabstop=4 textwidth=100 colorcolumn=99
au FileType rst setl textwidth=80 colorcolumn=81

" Make ruby,scss,sass,less use 2 spaces for indentation.
au FileType {cucumber,yaml,sass,scss,ruby,eruby,less} setl softtabstop=2 shiftwidth=2 tabstop=2 colorcolumn=100

" php settings
au FileType php setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 colorcolumn=120

" golang settings
au FileType go setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 noexpandtab colorcolumn=100

" markdown settings
au FileType markdown setl textwidth=80 softtabstop=4 shiftwidth=4 tabstop=4 colorcolumn=79

" Javascript, CSS, and html settings
au FileType {css,typescript,javascript,mustache,htmljinja,html} setl textwidth=120 softtabstop=2 shiftwidth=2 tabstop=2 colorcolumn=120

" CoffeeScript, Groovy, Elm, Docker
au FileType {coffee,groovy,elm,dockerfile} setl textwidth=100 softtabstop=2 shiftwidth=2 tabstop=2 colorcolumn=100
