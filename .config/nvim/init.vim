" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'lervag/vimtex'
"Plug 'sirver/ultisnips'
Plug 'Shougo/deoplete.nvim'
Plug 'joshdick/onedark.vim'
"Plug 'junegunn/seoul256.vim'
"Plug 'altercation/vim-colors-solarized'
Plug 'itchyny/lightline.vim'
Plug 'rstacruz/vim-closer'
Plug 'alvan/vim-closetag'
Plug 'preservim/nerdtree'
Plug 'bling/vim-bufferline'
Plug 'posva/vim-vue'
Plug 'dense-analysis/ale'
Plug 'preservim/vim-wordy'
Plug 'tidalcycles/vim-tidal'
Plug 'tpope/vim-commentary'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'wfxr/minimap.vim'
"Plug 'sslivkoff/vim-scroll-barnacle'
Plug 'psliwka/vim-smoothie'
call plug#end()

" general settings
set encoding=utf-8
" - whitespace
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
autocmd Filetype py setlocal tabstop=4
"set smarttab
" - indentation
set autoindent
set smartindent
set breakindent
" - wrapping
set linebreak
" - searching
set incsearch
set hlsearch
set ignorecase
set smartcase
" - turn off backups
set nobackup
set nowb
set noswapfile
" - visual / gui
set showcmd
set number
set mouse=a
" - navigating up and down in single-line paragraphs
nnoremap k gk
nnoremap j gj
" - show partial last lines instead of @ signs
set display+=lastline
" - return to last edit position (Amix)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" - sync clipboard
set clipboard+=unnamedplus
" - code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
" - allow unsaved background buffers
set hidden

" colorscheme
set termguicolors
set background=dark
colorscheme onedark
let g:onedark_terminal_italics=1

" set background to transparent
hi Normal guibg=None


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

" spelling 
set spelllang=en_gb
augroup spellingSettings
  autocmd!
  autocmd FileType markdown,tex setlocal spell
augroup END

" spelling shortcut from Gilles Castel (castel.dev):
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" deoplete
let g:deoplete#enable_at_startup = 1
" - use smartcase
call deoplete#custom#option('smart_case', v:true)

" closetag
let g:closetag_filetypes = 'vue,html'

" lightline
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
set noshowmode

" fix italics
highlight Comment cterm=italic gui=italic

" NERDTree
" - map to Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" - open automatically when vim starts with directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'NERDTree' argv()[0] | endif
" - close vim if only window left is NERDtree
"autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" - file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" vim-vue
let g:vue_pre_processors = []

" tidalcycles
let g:tidal_target = "terminal"

" minimap
let g:minimap_highlight_range = 1
let g:minimap_git_colors = 1
let g:minimap_highlight_search = 1
