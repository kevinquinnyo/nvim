" ALE (code linter)
let g:ale_linters = {'php': ['php', 'phpstan', 'phpmd']}
let g:ale_php_phpstan_executable = './vendor/bin/phpstan'
let g:ale_completion_enabled = 0

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'php': ['php_cs_fixer'],
\}

let g:ale_fix_on_save = 1
