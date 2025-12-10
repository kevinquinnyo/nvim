-- init.lua
-- Lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Color scheme
  { "morhetz/gruvbox" },
  -- LSP configuration
  { "neovim/nvim-lspconfig" },
  -- Common utilities
  { "nvim-lua/plenary.nvim" },
  -- Autocompletion plugin
  { "hrsh7th/nvim-cmp" },
  -- VSCode-like pictograms
  { "onsails/lspkind-nvim" },
  -- Snippets plugin
  { "L3MON4D3/LuaSnip" },
  -- Forked version of ALE temporarily
  -- { "kevinquinnyo/ale", branch = "phpstan-memory-limit-option" }, -- Corrected URL
  { "dense-analysis/ale"},



  -- Run tests in Vim
  { "janko/vim-test" },
  -- PHP code introspection and more
  {
    "phpactor/phpactor",
    build = function()
      vim.fn.system("cd " .. vim.fn.stdpath("data") .. "/lazy/phpactor && composer install --no-dev -n")
    end,
    config = function()
      -- Set PHPActor global settings
      vim.g.phpactorPhpBin = 'php'  -- PHP executable to use
      vim.g.phpactorBranch = 'master'  -- PHPActor branch to use
      vim.g.phpactorOmniAutoClassImport = true  -- Automatically import classes with omnicomplete

      -- Define key mappings
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      map('n', '<Leader>o', ':PhpactorGotoDefinition<CR>', opts)
      map('n', '<Leader>u', ':call phpactor#ImportClass<CR>', opts)
      map('n', '<Leader>mm', ':PhpactorContextMenu<CR>', opts)
      map('n', '<Leader>nn', ':PhpactorNavigate<CR>', opts)
      map('n', '<Leader>K', ':PhpactorHover<CR>', opts)
      map('n', '<Leader>tt', ':PhpactorTransform<CR>', opts)
      map('n', '<Leader>cc', ':PhpactorClassNew<CR>', opts)
      map('n', '<Leader>e', ':PhpactorClassExpand<CR>', opts)
      map('n', '<Leader>cv', ':PhpactorChangeVisibility<CR>', opts)
      map('n', '<Leader>pfm', ':PhpactorMoveFile<CR>', opts)

      -- Extract expression
      map('n', '<Leader>ee', ':PhpactorExtractExpression<CR>', opts)
      map('v', '<Leader>ee', ':PhpactorExtractExpression<CR>', opts)

      -- Extract method
      map('v', '<Leader>pem', ':PhpactorExtractMethod<CR>', opts)

    end
  },
  { "ncm2/ncm2" },
  { "roxma/nvim-yarp" },
  { "ncm2/ncm2-path" },
  { "ncm2/ncm2-bufword" },
  { "phpactor/ncm2-phpactor" },
  -- Syntax highlighting
  { "nvim-treesitter/nvim-treesitter" },
  -- Statusline plugin
  { "feline-nvim/feline.nvim" },
  -- Fuzzy file finder
  { "ctrlpvim/ctrlp.vim" },
  { "github/copilot.vim", url = "git@github.com:github/copilot.vim.git" },
  -- for :Git blame and friends
  { "tpope/vim-fugitive" },
})

-- Check if Composer is installed
local function check_composer()
  local handle = io.popen("composer --version")
  local result = handle:read("*a")
  handle:close()
  if not result:match("Composer version") then
    vim.api.nvim_err_writeln("Warning: Composer is not installed. PHPActor might not work correctly.")
  end
end

-- Call the check_composer function
check_composer()

-- General settings
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.smartindent = true -- Smart indentation
vim.opt.autoindent = true -- Auto-indent new lines
vim.opt.hidden = true -- Allow switching buffers without saving

vim.opt.mouse = ""

-- Hardmode
local hardmode = false
if hardmode then
    -- Show an error message if a disabled key is pressed
    local msg = [[<cmd>echohl Error | echo "KEY DISABLED" | echohl None<CR>]]

    -- Disable arrow keys in insert mode with a styled message
    vim.api.nvim_set_keymap('i', '<Up>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Down>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Left>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Right>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<Del>', '<C-o>' .. msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('i', '<BS>', '<C-o>' .. msg, { noremap = true, silent = false })

    -- Disable arrow keys in normal mode with a styled message
    vim.api.nvim_set_keymap('n', '<Up>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Down>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Left>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<Right>', msg, { noremap = true, silent = false })
    vim.api.nvim_set_keymap('n', '<BS>', msg, { noremap = true, silent = false })
end

-- cycle through buffers with tab and shift-tab
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprev<CR>', { noremap = true })

-- i hold shift for too long when doing wq, "fix" it
vim.api.nvim_set_keymap('n', 'W', ':w<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'Wq', ':wq<CR>', { noremap = true })

-- Enable true color support
vim.opt.termguicolors = true

-- Set color scheme
vim.cmd('colorscheme gruvbox')
vim.opt.background = "dark"

-- ALE configuration
vim.g.ale_php_phpcs_executable = 'phpcs'
vim.g.ale_php_phpstan_executable = 'phpstan'
vim.g.ale_php_phpstan_memory_limit = '-1'
vim.g.ale_linters = { php = {'php', 'phpcs', 'phpstan'} }
vim.g.ale_fixers = {
    ['*'] = { 'remove_trailing_lines', 'trim_whitespace' },
    php = { 'phpcbf' },
}
-- TODO re-enable
vim.g.ale_fix_on_save = 0
vim.g.ale_php_phpcbf_executable = '/Users/kevin/bin/phpcbf-wrapper.sh'

-- Shortcut for showing full ALE lint error message
vim.api.nvim_set_keymap('n', '<leader>ee', ':ALEDetail<CR>', { noremap = true, silent = true })

-- Edit this file
vim.api.nvim_set_keymap('n', '<Leader>ev', ':e $MYVIMRC<CR>', { noremap = true, silent = true })

-- Edit .zshrc file
vim.api.nvim_set_keymap('n', '<Leader>ez', ':e ~/.zshrc<CR>', { noremap = true, silent = true })

-- PHPActor key mappings
vim.api.nvim_set_keymap('n', '<Leader>o', ':PhpactorGotoDefinition<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>u', ':PhpactorImportClass<CR>', { noremap = true, silent = true })

-- CtrlP key mappings
--vim.g.ctrlp_map = '<c-f>'
-- Manually set CtrlP key mapping
vim.api.nvim_set_keymap('n', '<C-f>', ':CtrlP<CR>', { noremap = true, silent = true })
vim.g.ctrlp_cmd = 'CtrlP'
vim.g.ctrlp_max_depth = 50
vim.g.ctrlp_cache_dir = vim.fn.expand("$HOME") .. "/.cache/ctrlp"


if vim.fn.executable("ag") == 1 then
  vim.g.ctrlp_user_command = "ag %s -l --nocolor -g \"\""
end

-- Feline configuration
require('feline').setup()

-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "python", "javascript", "html", "css", "php", "go", "rust" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = { },
    additional_vim_regex_highlighting = false,
  },
}

-- Misc
vim.api.nvim_set_keymap('n', '<Leader>ev', ':e $MYVIMRC<CR>', { noremap = true, silent = true })
vim.cmd("iabbrev dst declare(strict_types=1);") -- type dst to add declare(strict_types=1);

-- phpactor global config
vim.g.phpactorPhpBin = 'php' -- PHP executable to use
vim.g.phpactorBranch = 'master' -- PHPActor branch to use
vim.g.phpactorOmniAutoClassImport = true -- Automatically import classes with omnicomplete

-- ncm2 stuff
-- Enable ncm2 for all buffers on BufEnter.
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.fn["ncm2#enable_for_buffer"]()
  end,
})

-- Set the 'completeopt' options.
vim.o.completeopt = "noinsert,menuone,noselect"

-- In insert mode, use <Tab> and <S-Tab> to navigate the popup menu.
vim.keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })

vim.keymap.set("i", "<S-Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true })
