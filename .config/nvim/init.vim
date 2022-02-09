" Jason Ross Neovim Config
" https://www.jasonross.dev

set encoding=UTF-8

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'bling/vim-airline'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'alvan/vim-closetag'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
" File Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Language Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-highlight']
" TypeScript Highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" File Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'dracula/vim' "theme
Plug 'EdenEast/nightfox.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'scrooloose/nerdtree' "nerdtree
Plug 'ryanoasis/vim-devicons' "icons for nerdtree
call plug#end()
"Config Section

" START General Settings
  " Line number configuration
   set number
   set relativenumber
   " Tab configuration
   set smarttab
   set cindent
   set tabstop=2
   set shiftwidth=2
   set expandtab
   " Allow mouse clicks
   set mouse=a
   " Change the escape key to jk
   inoremap jk <Esc>
   tnoremap jk <C-\><C-n>
   " Disable commenting on new line
   autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  " Set Backup
  set backup
" END General Settings

" START FILE SEARCHING
  "CTRL+P to allow file searching
  "CTRL+T to open it in a new tab.
  "CTRL+S to open below (split view).
  "CTRL+T to open to the side (vertical split).
  "Enter to open it in the currently selected panel.
  nnoremap <C-p> :FZF<CR>
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \}
"END FILE SEARCHING


" START dracula/vim theme config
"  if (has("termguicolors"))
"   set termguicolors
"  endif
"  syntax enable
" colorscheme duskfox
" colorscheme dracula
" colorscheme github_*
" END dracula/vim theme config
" colorscheme tokyonight
"let g:storm = {'colorscheme': 'tokyonight'}
"set background=dark
"colorscheme nightfox
colorscheme duskfox

" START NERDTree Config
  let g:NERDTreeShowHidden = 1
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeIgnore = []
  let g:NERDTreeStatusline = ''
  " Automaticaly close nvim if NERDTree is only thing left open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " Toggle
  nnoremap <silent> <C-b> :NERDTreeToggle<CR>
  autocmd VimEnter * NERDTree
" END NERDTree Config
"
" " open new split panes to right and below
set splitright
set splitbelow

" START Keybindings for split navigation
  " Use Ctrl+hjkl to move between split/vsplit panels
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
" END Keyboardings for split navigation

  " turn terminal to normal mode with escape
  tnoremap <Esc> <C-\><C-n>
  " start terminal in insert mode
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  " open terminal on ctrl+n
  function! OpenTerminal()
    split term://bash
    resize 10
  endfunction
  nnoremap <c-n> :call OpenTerminal()<CR>
" END Integrated Terminal Config

" START clipboard settings
  " allow copy all lines :%y to work
  set clipboard+=unnamedplus
" END clipboard settings

"set guifont=FiraCode\ Nerd\ Font:h11
set guifont=SpaceMono\ Nerd\ Font:h13
" required if using https://github.com/bling/vim-airline
let g:airline_powerline_fonts=1

func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  setlocal spell spelllang=en_us
  set thesaurus+=/home/test/.vim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
com! WP call WordProcessor()

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Example config in VimScript
" NOTE: Configuration needs to be set BEFORE loading the color scheme with `colorscheme` command
"let g:github_function_style = "italic"
"let g:github_sidebars = ["qf", "vista_kind", "terminal", "packer"]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
"let g:github_colors = {
"  \ 'hint': 'orange',
"  \ 'error': '#ff0000'
"\ }

" Load the colorscheme
"colorscheme github_dark_default





" Example config in VimScript
"let g:tokyonight_style = "night"
"let g:tokyonight_italic_functions = 1
"let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

"" Change the "hint" color to the "orange" color, and make the "error" color bright red
"let g:tokyonight_colors = {
"  \ 'hint': 'orange',
"  \ 'error': '#ff0000'
"\ }

" Load the colorscheme
"colorscheme tokyonight

