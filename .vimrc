set nocompatible

let mapleader = ","

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Bundle 'gmarik/vundle'
Bundle 'derekwyatt/vim-scala'
Bundle 'repos-scala/scala-vundle'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-vinegar'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-fugitive'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'Shougo/neocomplete.vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/greplace.vim'
Bundle 'burnettk/vim-angular'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'
Bundle 'idris-hackers/idris-vim'
Bundle 'mxw/vim-jsx'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rompetroll/vim-scalariform'
Bundle 'djoshea/vim-autoread'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/taglist.vim'
Bundle 'jiangmiao/auto-pairs'

call vundle#end()
filetype plugin indent on

syntax on
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set expandtab
set sm
set tabstop=2
set wrap
set vb

set tags=tags;/

" line numbers
set number

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" Highlight things that we find with the search
set hlsearch

" enable mouse
set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

colorscheme lucius
let g:lucius_no_term_bg = 1
LuciusBlackLowContrast
set guifont=Inconsolata\ 9
highlight LineNr ctermfg=grey ctermbg=black

" slim cursor for insert mode
" block cursor for normal mode
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" upon hitting escape to change modes,
" send successive move-left and move-right
" commands to immediately redraw the cursor
inoremap <special> <Esc> <Esc>hl

" don't blink the cursor
set guicursor+=i:blinkwait0

" use j/k to navigate autocomplete suggestions
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" allow deleting outside of insert mode scope
set backspace=2

" apply q macro with space
nnoremap <space> @q

let g:neocomplete#enable_at_startup = 1

set wildignore+=*.swp,*.class,*.jar

" idris comment for vim-commentary
autocmd FileType idris set commentstring=--\ %s

" jsx files config
let g:jsx_ext_required=0

" 120 char delimiter on .scala files
autocmd FileType scala set cc=121

" enable ctags
set tags=./.tags,.tags,./tags,tags

" nerdtree toggle
nmap <F9> :NERDTreeToggle<CR>

" ctags tab toggle
nmap <F8> :TagbarToggle<CR>

" jump to ctag in a vertical split with alt + ]
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
