-- BASIC SETTINGS
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true
vim.opt.background = 'dark'
vim.opt.termguicolors = true

-- Use 2 spaces instead of tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.timeoutlen = 600

-- Save everything the defaults do in sessions except hidden/unloaded buffers
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize"

-- Automatically enable mouse usage
vim.opt.mouse = 'a'
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Blink block cursor in N mode
vim.api.nvim_exec('set guicursor+=n:blinkon100', false)

-- MAPPINGS
local map = function(mode, key, result, opts)
  opts = opts or {}
  if opts.noremap == nil then opts.noremap = true end
  if opts.silent == nil then opts.silent = true end
  vim.api.nvim_set_keymap(mode, key, result, opts)
end

-- <CR-l> and <CR-h> to tab forward and backward
map('n', '<c-l>', 'gt')
map('n', '<c-h>', 'gT')

-- H and L for start and end of line
map('n', 'H', '^')
map('v', 'H', '^')
map('n', 'L', '$')
map('v', 'L', '$')

-- <Leader><Esc> to kill highlighting on last search
map('n', '<leader><esc>', ':noh \n')
-- <Leader>W for window movements
map('n', '<leader>w', '<c-w>')
map('n', '<leader>q', ':q\n')
map('n', '<leader>o', ':tabe ', { silent = false })
map('n', '<leader>s', ':w\n')

-- <Leader>x to delete and put in garbage register (delete but don't affect clipboard)
map('n', '<leader>x', '"gx')
-- <leader>d as lias for d<motion> and put in garbage regsiter
map('n', '<leader>d', '"gd')

-- <Leader>[ and <Leader>] to insert a blank line above or below current line while in insert mode
vim.api.nvim_exec('nnoremap <silent> <leader>[ :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', false)
vim.api.nvim_exec('nnoremap <silent> <leader>] :<C-u>call append(line("."),   repeat([""], v:count1))<CR>', false)

-- PLUGINS
require('plugins')

vim.cmd 'colorscheme material'

-- Telescope mappings
map('n', '<C-p>', ':lua require"telescope.builtin".find_files()<CR>')
map('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
map('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
map('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')
 
-- I _never_ want Telescope to open anything in a new buffer, only a new tab
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["<cr>"] = actions.select_tab
      },
      i = {
        ["<cr>"] = actions.select_tab
      },
    },
  }
}

