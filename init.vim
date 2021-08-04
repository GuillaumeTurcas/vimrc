set nocompatible              " be improved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Theme
Plugin 'mhartington/oceanic-next'             " Oceanic Next theme
Plugin 'sickill/vim-monokai'
Plugin 'junegunn/seoul256.vim'
Plugin 'morhetz/gruvbox'
Plugin 'reedes/vim-colors-pencil'
Plugin 'arzg/vim-colors-xcode'
Plugin 'sonph/onehalf', { 'rtp': 'vim' }
Plugin 'frazrepo/vim-rainbow'
Plugin 'itchyny/lightline.vim'
Plugin 'sheerun/vim-polyglot'

" Gui enhancements
Plugin 'junegunn/goyo.vim'                " for markdown files
Plugin 'machakann/vim-highlightedyank'    " highlight lines while yanking
Plugin 'chrisbra/csv.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tell-k/vim-autopep8'              " Auto Pep-8

" Semantic language support
Plugin 'ncm2/ncm2'                        " autocompletion
Plugin 'roxma/nvim-yarp'                  " remote plugin framework required by ncm2
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'eugen0329/vim-esearch'

" Completion plugins
Plugin 'numirias/semshi', {'do': ':UpdateRemotePlugins'} 
Plugin 'codota/tabnine-vim'
Plugin 'tpope/vim-surround'
Plugin 'ncm2/ncm2-bufword'                " autocomplete words from current buffer
Plugin 'ncm2/ncm2-path'                   " filepath completion
Plugin 'jiangmiao/auto-pairs'             " auto close parens, braces and brackets
Plugin 'scrooloose/nerdcommenter'         " easy commenting of code

" File browser
Plugin 'scrooloose/nerdtree'
Plugin 'rhysd/open-pdf.vim'
Plugin 'tpope/vim-fugitive'

" Move code
Plugin 'tpope/vim-unimpaired'             " move lines of code around using alt+j/k

" Syntactic language support
Plugin 'HerringtonDarkholme/yats.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

imap jj <Esc>

nmap j gj
nmap k gk

set nu
set rnu
set tabstop=4
set shiftwidth=4
set expandtab
set autochdir 
set smartindent
set autoindent
set cindent
set softtabstop=3
set backspace=indent,eol,start
set mouse=a
set noshowmode
set showcmd
set nobackup
set noswapfile
set smartcase
set ruler
set cursorline
set colorcolumn=80
set splitbelow
set title
set hlsearch
set laststatus=2

let mapleader = ","

map <C-m>  :tabnew <CR>
nmap <C-k> :tabnext <CR>
nmap <C-j>  :tabprevious <CR>

nmap <C-n> :NERDTreeToggle<CR>
nmap <C-t> :term<CR>

nmap <C-q> :q!<CR>
nmap q :q<CR>

nmap <C-l> :Limelight <CR>
nmap <C-p> :Limelight! <CR>
nmap <C-a> :Autopep8 <CR> :q <CR>

tnoremap jj <C-\><C-n>

colorscheme xcodedarkhc
syntax on

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" Optionally reset the cursor on start:

augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END


autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufWinEnter * silent NERDTreeMirror
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>

function! s:auto_goyo()
  if exists('#lightline')
    call lightline#update()
  endif
  if &ft == 'markdown'
    Goyo 80
    Limelight
    colorscheme pencil
    imap q1 #
    imap w2 ##
    imap e3 ###
    imap r4 ####
    imap t5 #####
    imap y6 ######
  elseif exists('#goyo')
    let bufnr = bufnr('%')
    Goyo!
    execute 'b '.bufnr
  endif
endfunction


augroup goyo_markdown
  autocmd!
  " autocmd BufNewFile *.md r ~/.config/nvim/files/init.md
  autocmd BufNewFile,BufRead * call s:auto_goyo()
augroup END

autocmd! User GoyoLeave nested  :q  

autocmd! BufReadPost *.pdf :Pdf %:t | wincmd w | :q | :Goyo
autocmd! BufLeave *pdf rm -rf ~/.open-pdf.vim.cache
