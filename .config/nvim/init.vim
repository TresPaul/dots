"-----------------------------------------
"  Plugins
"-----------------------------------------

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
"Plug 'sirver/ultisnips'
Plug 'Shougo/deoplete.nvim'
"Plug 'joshdick/onedark.vim'
"Plug 'junegunn/seoul256.vim'
"Plug 'altercation/vim-colors-solarized'
Plug 'ellisonleao/gruvbox.nvim'
"Plug 'itchyny/lightline.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'rstacruz/vim-closer'
Plug 'alvan/vim-closetag'
"Plug 'preservim/nerdtree'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'bling/vim-bufferline'
"Plug 'posva/vim-vue'
Plug 'dense-analysis/ale'
Plug 'preservim/vim-wordy'
Plug 'supercollider/scvim'
Plug 'tidalcycles/vim-tidal'
Plug 'tpope/vim-commentary'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'wfxr/minimap.vim'
"Plug 'sslivkoff/vim-scroll-barnacle'
"Plug 'psliwka/vim-smoothie'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"Plug 'tweekmonster/startuptime.vim'
call plug#end()


"-----------------------------------------
"  General setup
"-----------------------------------------

" turn off built-in file browser
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

set encoding=utf-8

" whitespace
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
autocmd Filetype py setlocal tabstop=4
"set smarttab

" indentation
set autoindent
set smartindent
set breakindent

" wrapping
set linebreak

" searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" turn off backups
set nobackup
set nowb
set noswapfile

" undo
set undodir=~/.vimundos
set undofile

" visual / gui
set showcmd
set number
set scrolloff=2
set sidescrolloff=2
" - show partial last lines instead of @ signs
set display+=lastline
set mouse=a
" - scroll smoothly
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" return to last edit position (Amix)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" clipboard
set clipboard+=unnamedplus

" code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" allow unsaved background buffers
set hidden

" spelling 
set spelllang=en_gb
augroup spellingSettings
  autocmd!
  autocmd FileType markdown,tex,xhtml setlocal spell
augroup END

" set python path for faster startup, maybe
let g:python3_host_prog = expand('/usr/bin/python')


"-----------------------------------------
"  Appearance
"-----------------------------------------

set guifont=FiraCode\ Nerd\ Font\ 14

" fix italics
"highlight Comment cterm=italic gui=italic

set termguicolors
set background=dark

"colorscheme onedark
"let g:onedark_terminal_italics=1

"colorscheme gruvbox

lua << EOF
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  dim_inactive = false,
  transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")
EOF

" remove background set by colorscheme
hi Normal guibg=None

" highlighting embedded lua/Python/ruby in vim files
let g:vimsyn_embed = 'lPr'

"-----------------------------------------
"  Keymaps
"-----------------------------------------

let mapleader=";"
nnoremap <leader>h :noh<CR>

" navigating up and down in single-line paragraphs
nnoremap k gk
nnoremap j gj

" window navigation
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l

" fzf
nnoremap <silent> <leader>fu :FZF<CR>

" window sizing
nnoremap <silent> <leader>H <C-w><h
nnoremap <silent> <leader>L <C-w>>l

" buffer navigation
nnoremap <silent> <C-l> :bn<CR>
nnoremap <silent> <C-h> :bp<CR>

" quick config edit
nnoremap <silent> <leader>ce :e $MYVIMRC<CR>
nnoremap <silent> <leader>cs :source $MYVIMRC<CR>

" open vim-markdown ToC
nnoremap <silent> <leader>toc :Toc<CR>

" spelling shortcut from Gilles Castel (castel.dev):
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


" from Jess Archer
" https://github.com/jessarcher/dotfiles/blob/master/nvim/init.vim

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Make Y behave like the other capitals
nnoremap Y y$

" Keep it centered
"nnoremap n nzzzv
"nnoremap N Nzzzv
"nnoremap J mzJ`z

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" sudo write
cmap w!! %!sudo tee > /dev/null %


"-----------------------------------------
"  Plugin settings
"-----------------------------------------

" vimtex
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" UltiSnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" deoplete
let g:deoplete#enable_at_startup = 1
" - use smartcase
call deoplete#custom#option('smart_case', v:true)
"call deoplete#custom#option('sources', {
"\ '_': ['ale'],
"\})

" closetag
let g:closetag_filetypes = 'vue,html'

" lightline
"let g:lightline = {
"  \ 'colorscheme': 'onedark',
"  \ }
set noshowmode

" lualine
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
EOF

" vim-vue
let g:vue_pre_processors = []

" tidalcycles
let g:tidal_target = "terminal"

" minimap
let g:minimap_highlight_range = 1
let g:minimap_git_colors = 1
let g:minimap_highlight_search = 1

" vim-markdown
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_math = 1

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nvim-tree.lua
lua << EOF
require("nvim-tree").setup()
EOF

" pandoc
let g:pandoc#folding#fdc = 0

" NERDTree

" - map to Ctrl+n
"map <C-n> :NERDTreeToggle<CR>

" - open automatically when vim starts with directory
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif

" - close vim if only window left is NERDtree
"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" - file highlighting
"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
" exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
" exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction
"call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
