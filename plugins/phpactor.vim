" More key mappings for phpactor
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

" some extra phpactor maps
map <silent><Leader>pfm :call phpactor#MoveFile()<CR>
nmap <Leader>e :call phpactor#ClassExpand()<CR>
nmap <Leader>cv :call phpactor#ChangeVisibility()<CR>
nmap <silent><Leader>K :call phpactor#Hover()<CR>

" phpactor additional config
let g:phpactorPhpBin = 'php' " php executable to use
let g:phpactorBranch = 'master' " phpactor branch to use
let g:phpactorOmniAutoClassImport = v:true " automatically import classes with omnicomplete
