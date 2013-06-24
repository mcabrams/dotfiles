set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'


"!=!=!= BUNDLES =!=!=

" === Alignment =====

Bundle 'Align'
Bundle 'Tabular'

" === AutoClosing =====

Bundle 'closetag.vim'
Bundle 'delimitMate.vim'

" ===== Ctags =======

Bundle 'AutoTag'
Bundle 'Tagbar'
Bundle 'vim-scripts/taglist.vim'

" ===== Navigation =======

Bundle 'bufexplorer.zip'
Bundle 'ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'matchit.zip'
Bundle 'xolox/vim-session'

" ===== RubyAndRails

Bundle 'tpope/vim-rvm'
Bundle 'danchoi/ruby_bashrockets.vim'
Bundle 'tpope/vim-endwise'

" ===== Syntax ======

Bundle 'Haml'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'html5.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-haml'

" ===== Testing ======

Bundle 'Rubytest.vim'
Bundle 'rails.vim'

" === Theme/Colors ===

Bundle 'airblade/vim-gitgutter'
Bundle 'chrisbra/color_highlight'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'dhruvasagar/vim-railscasts-theme'
Bundle 'skammer/vim-css-color'
Bundle 'xolox/vim-colorscheme-switcher'

" === Prereqs ======

Bundle 'rizzatti/funcoo.vim'
Bundle 'xolox/vim-misc'

" === Misc =========

Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'SuperTab'
Bundle 'fugitive.vim'
Bundle 'jpalardy/spacehi.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'rizzatti/dash.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'surround.vim'
Bundle 'terryma/vim-multiple-cursors'

" ==== Disabled =====

"Bundle 'jistr/vim-nerdtree-tabs'
"Bundle 'xolox/vim-easytags'
"Bundle 'Yggdroot/indentLine'

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %l,\ col:\ %c%v\ (%p)%)
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"set statusline+=rvm#statusline()
filetype plugin indent on

autocmd! BufRead,BufNewFile *.sass setfiletype sass
autocmd! BufRead,BufNewFile *.scss setfiletype scss

let mapleader = ","

syntax on
set autoindent
set cursorline
set go-=L
set go-=r 
set history=1000
set hlsearch
set incsearch
set nowrap
set number
set showmatch
if has("unnamedplus")
  set clipboard=unnamedplus
elseif has("clipboard")
  set clipboard=unnamed
endif


" ================= Folding ========================

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set guifont=Monaco\ for\ Powerline:h12
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

" indentLine setup

"let g:indentLine_char = '⁞'
"let g:indentLine_color_gui = '#3b3b3b' 
"let g:indentLine_noConcealCursor=0

" Tagbar
map <leader>g :TagbarToggle<CR>

" Rubytest
" let g:rubytest_in_quickfix = 1
map <Leader>/ <Plug>RubyTestRunLast " change from <Leader>l to <Leader>/ 

" NERDtree
autocmd vimenter * NERDTree
let NERDTreeIgnore=['doc', '\.pyc', '\.rbc$', '\~$', '\.DS_Store$', 'tmp', 'log']
let NERDTreeChDirMode=2
let NERDTreeMouseMode=3
let NERDTreeQuitOnOpen=0
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
map <leader>n :NERDTreeToggle<cr>
nmap <leader>f :NERDTreeFind<CR>

" powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2

" Colorscheme
colorscheme railscasts
colorscheme Tomorrow-Night

" Enable Matchit.vim
runtime macros/matchit.vim


"""""""""""""""""""""""""""""""""""""""""""""
" Functions from Vimcasts and other places! "
"""""""""""""""""""""""""""""""""""""""""""""

" Nohlsearch hotkeys

noremap <leader>h :nohlsearch<CR>

"Convert Ruby 1.8 to 1.9 hash syntax

nmap <leader>cr 

" StripTrailingWhitespaces function and mapping with autocmd on saves
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
" autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

" Windowswap Function; see http://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim
function! MarkWindowSwap()
  let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
  "Mark destination
  let curNum = winnr()
  let curBuf = bufnr( "%" )
  exe g:markedWinNum . "wincmd w"
  "Switch to source and shuffle dest->source
  let markedBuf = bufnr( "%" )
  "Hide and open so that we aren't prompted and keep history
  exe 'hide buf' curBuf
  "Switch to dest and shuffle source->dest
  exe curNum . "wincmd w"
  "Hide and open so that we aren't prompted and keep history
  exe 'hide buf' markedBuf
endfunction

noremap <silent> <leader>mw :call MarkWindowSwap()<CR>
noremap <silent> <leader>pw :call DoWindowSwap()<CR>


" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" Set list shortcut
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Allow vimrc editing
nmap <leader>v :tabedit $MYVIMRC<CR>

" Reopen last file in vs
nmap <c-s-t> :vs<bar>:b#<CR>

" ================ Completion =======================
set wildmode=full
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/tmp/*
