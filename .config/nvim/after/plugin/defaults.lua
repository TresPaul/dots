-- customisation of kickstart.nvim
-- get kickstart with:
-- curl https://raw.githubusercontent.com/nvim-lua/kickstart.nvim/master/init.lua > ~/.config/nvim/init.lua
-- customisation in that file is just adding haskell to treesitter config (line 224) and adding the haskell language server to the lsp / mason config (line 353)


-- TREE

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function open_nvim_tree(data)
  if vim.fn.isdirectory(data.file) == 1 then
    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
  end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })


-- THEME & DISPLAY

vim.cmd.colorscheme 'gruvbox'
vim.cmd.hi 'Normal guibg=None'
vim.o.guifont = "FiraCode Nerd Font 11"
vim.wo.signcolumn = 'auto'
vim.cmd("let g:pandoc#folding#fdc = 0")


-- SPELLING

vim.o.spelllang = "en_gb"
vim.cmd([[
augroup spellingSettings
  autocmd!
  autocmd FileType markdown,tex,xhtml setlocal spell
augroup END
]])


-- MISC BEHAVIOUR

-- return to last edit position (amix)
vim.cmd([[au bufreadpost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])


-- KEYMAPS

vim.keymap.set('n', "<C-N>", ":NvimTreeFocus<CR>")

-- spelling shortcut from Gilles Castel (castel.dev):
vim.keymap.set('i', "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u")

-- buffer navigation
vim.keymap.set('n', "<C-l>", ":bn<CR>")
vim.keymap.set('n', "<C-h>", ":bp<CR>")

-- maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
vim.keymap.set('v', 'y', "myy`y")
vim.keymap.set('v', 'Y', "myY`y")

-- reselect visual selection after indenting
vim.keymap.set('v', '<', "<gv")
vim.keymap.set('v', '>', ">gv")

-- quick config edit
vim.keymap.set('n', "<leader>ce", ":e ~/.config/nvim/after/plugin/defaults.lua<CR>")
vim.keymap.set('n', "<leader>cs", ":source ~/.config/nvim/after/plugin/defaults.lua<CR>")
vim.keymap.set('n', "<leader>ck", ":e ~/.config/nvim/init.lua<CR>")
