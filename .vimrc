set nocompatible

let mapleader = ","

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" the plugin manager
Plugin 'gmarik/vundle'

" scala support
Plugin 'derekwyatt/vim-scala'
Plugin 'repos-scala/scala-vundle'

" navigate seamlessly between vim and tmux panes
Plugin 'christoomey/vim-tmux-navigator'

" theme
Plugin 'joshdick/onedark.vim'

" fuzzy file finder
Plugin 'kien/ctrlp.vim'

" a nice status bar
Plugin 'bling/vim-airline'

" git support
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" make trailing whitespaces stand-out
Plugin 'bronson/vim-trailing-whitespace'

" fuzzy autocompletion support
Plugin 'Shougo/neocomplete.vim'

" surround things (parenthesis and friends)
Plugin 'tpope/vim-surround'

" comment with gc/gcc
Plugin 'tpope/vim-commentary'

" async inline linting for multiple languages
Plugin 'w0rp/ale'

" javascript/jsx support
Plugin 'pangloss/vim-javascript'

" nicer project drawer
Plugin 'scrooloose/nerdtree'

" autoreload buffers when files change on disk
Plugin 'djoshea/vim-autoread'

" automatically close parenthesis
Plugin 'jiangmiao/auto-pairs'

" copy buffer from vim to tmux
Plugin 'jpalardy/vim-slime'

" find stuff in files
Plugin 'rking/ag.vim'

" terraform files syntax
Plugin 'hashivim/vim-terraform'

" typescript
Plugin 'leafgarland/typescript-vim'

call vundle#end()
filetype plugin indent on

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
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

syntax on
colorscheme onedark

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
let g:neocomplete#enable_auto_select = 1

set wildignore+=*.swp,*.class,*.jar

" idris comment for vim-commentary
autocmd FileType idris set commentstring=--\ %s

" jsx files config
let g:jsx_ext_required=0

" 120 char delimiter on .scala files
autocmd FileType scala set cc=101

" 100 char delimiter on .java files
autocmd FileType java set cc=101

" Enable heavy omni completion.
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.java = '\k\.\k*'
let g:neocomplete#force_omni_input_patterns.scala = '\k\.\k*'

" nerdtree toggle
nmap <F9> :NERDTreeToggle<CR>

" vim-slime configuration
let g:slime_target = "tmux"

" ctrlp only current directory
let g:ctrlp_working_path_mode = 'a'

" make crontab like vim
autocmd filetype crontab setlocal nobackup nowritebackup

" support for qualified tags (see https://github.com/pjrt/stags#vim-support-for-qualified-tags)
function! QualifiedTagJump() abort
  let l:plain_tag = expand("<cword>")
  let l:orig_keyword = &iskeyword
  set iskeyword+=\.
  let l:word = expand("<cword>")
  let &iskeyword = l:orig_keyword

  let l:splitted = split(l:word, '\.')
  let l:acc = []
  for wo in l:splitted
    let l:acc = add(l:acc, wo)
    if wo ==# l:plain_tag
      break
    endif
  endfor

  let l:combined = join(l:acc, ".")
  try
    execute "ta " . l:combined
  catch /.*E426.*/ " Tag not found
    execute "ta " . l:plain_tag
  endtry
endfunction

" nnoremap <silent> <C-]> :<C-u>call QualifiedTagJump()<CR>

" ctrl+\ open ctag in a vertical split
nnoremap <C-\> :set splitright<CR> :vsp <CR>:<C-u>call QualifiedTagJump()<CR>

set tags=tags;/
