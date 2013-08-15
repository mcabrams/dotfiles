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
Bundle 'junegunn/vim-easy-align'

" === AutoClosing =====

Bundle 'closetag.vim'
Bundle 'delimitMate.vim'

" ===== Ctags =======

Bundle 'xolox/vim-easytags'
Bundle 'Tagbar'
Bundle 'vim-scripts/taglist.vim'

" ===== Navigation =======

Bundle 'ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'matchit.zip'
Bundle 'xolox/vim-session'
Bundle 'techlivezheng/vim-plugin-minibufexpl'
Bundle 'mileszs/ack.vim'
Bundle 'mhinz/vim-startify'
Bundle 'henrik/vim-indexed-search'

" ===== RubyAndRails

Bundle 'tpope/vim-rvm'
Bundle 'danchoi/ruby_bashrockets.vim'
Bundle 'tpope/vim-endwise'
Bundle 'blockle.vim'

" ===== Javascript

Bundle 'jelera/vim-javascript-syntax'
Bundle 'marijnh/tern_for_vim'
Bundle 'teramako/jscomplete-vim'

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
Bundle 'croaky/vim-colors-github'
Bundle 'mcabrams/github.vim'
Bundle 'mikewest/vimroom'

" === Prereqs ======

Bundle 'rizzatti/funcoo.vim'
Bundle 'xolox/vim-misc'

" === Misc =========

Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'jpalardy/spacehi.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'mattn/emmet-vim'
Bundle 'UltiSnips'
Bundle 'rizzatti/dash.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'surround.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'sjl/vitality.vim'
Bundle 'itspriddle/vim-marked'
Bundle 'jpalardy/vim-slime'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Tabmerge'
Bundle 'xolox/vim-notes' 
Bundle 'tpope/vim-unimpaired'
Bundle 'moll/vim-node'

" ==== Disabled =====

" Bundle 'bufexplorer.zip'
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Bundle 'othree/xml.vim'
" Bundle 'jistr/vim-nerdtree-tabs'
" Bundle 'AutoTag'
" Bundle 'Yggdroot/indentLine'
" Bundle 'SuperTab'
" Bundle 'junegunn/vim-github-dashboard'
" Bundle 'pangloss/vim-javascript'
" Bundle 'myusuf3/numbers.vim'

" number.vim config
let g:enable_numbers = 0

" vim-notes config
:let g:notes_directories = ['~/Dropbox/Notes']
:let g:notes_suffix = '.txt'
:let g:notes_title_sync = 'rename_file'

let g:UltiSnipsSnippetDirectories=["UltiSnips", "UltiSnips/mcabrams_snips"]

" rails.vim
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

filetype plugin indent on

autocmd! BufRead,BufNewFile *.sass setfiletype sass
autocmd! BufRead,BufNewFile *.scss setfiletype scss

let mapleader = ","
set laststatus=2

syntax on
set autoindent
set smartindent
set cursorline
set go-=L
set go-=r 
set history=1000
set hlsearch
set incsearch
set nowrap
set number
set showmatch
set showcmd
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
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
" set guifont=Monaco\ for\ Powerline:h12
set linespace=2
" set guifont=Andale\ Mono:h12
set guifont=Menlo\ for\ Powerline:h11
" set guifont=Consolas\ for\ Powerline:h12
" set linespace=1
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType sass set omnifunc=sasscomplete#CompleteSASS
autocmd FileType javascript
  \ :setl omnifunc=jscomplete#CompleteJS

let g:jscomplete_use = ['dom', 'moz']

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

" Slime.vim

let g:slime_target = "tmux"

"nerdcommenter

let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1

" Rubytest
" let g:rubytest_in_quickfix = 1
map <Leader>/ <Plug>RubyTestRunLast " change from <Leader>l to <Leader>/ 

" NERDtree
" Get startify and nerdtree working on startup
autocmd VimEnter *
      \ if !argc() |
      \   Startify |
      \   NERDTree |
      \   execute "normal \<c-w>w" |
      \ endif
hi StartifyHeader  ctermfg=203
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

" startify

let g:startify_custom_header = [
 \ '   _______  __  __  ______  ___   ___  ________  ______   ______  ______     ',
 \ ' /_______/\/_/\/_/\/_____/\/___/\/__/\/_______/\/_____/\ /_____/\/_____/\    ',
 \ ' \::: _  \ \:\ \:\ \:::__\/\::.\ \\ \ \::: _  \ \:::_ \ \\:::_ \ \:::_ \ \   ',
 \ '  \::(_)  \/\:\ \:\ \:\ \  _\:: \/_) \ \::(_)  \ \:(_) ) )\:\ \ \ \:\ \ \ \  ',
 \ '   \::  _  \ \:\ \:\ \:\ \/_/\:. __  ( (\:: __  \ \: __ `\ \:\ \ \ \:\ \ \ \ ',
 \ '    \::(_)  \ \:\_\:\ \:\_\ \ \: \ )  \ \\:.\ \  \ \ \ `\ \ \:\_\ \ \:\_\ \ \',
 \ '     \_______\/\_____\/\_____\/\__\/\__\/ \__\/\__\/\_\/ \_\/\_____\/\_____\/',
 \ '',
 \ '',
 \ ]

" powerline
" set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" airline
let g:airline_theme='tomorrow'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'

" Colorscheme
" colorscheme railscasts
colorscheme Tomorrow-Night
" colorscheme github_modified
"colorscheme github

" Enable Matchit.vim
runtime macros/matchit.vim

" Disable vim-session autosave
let g:session_autosave = 'no'

" mbe config
let g:did_minibufexplorer_syntax_inits = 1
map <Leader>mbe :MBEOpen<cr>
map <Leader>mbc :MBEClose<cr>
map <Leader>mbt :MBEToggle<cr>

" map gitgutter jumping
map <Leader>ngg :GitGutterNextHunk<cr>
map <Leader>pgg :GitGutterNextHunk<cr>

" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

"""""""""""""""""""""""""""""""""""""""""""""
" Functions from Vimcasts and other places! "
"""""""""""""""""""""""""""""""""""""""""""""

" Store swap file in single local directory
set directory=~/.vim/swap,.

"Close hidden buffers

function! DeleteHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction

" Allows javascript expected bracket movement
inoremap <C-Return> <CR><CR><C-o>k<Tab>

" Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Nohlsearch hotkeys

:nnoremap <CR> :nohlsearch<cr>

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

"Close hidden buffers in current tab
command! -nargs=* Only call CloseHiddenBuffers()
function! CloseHiddenBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that are loaded and not visible
  let l:tally = 0
  for b in range(1, bufnr('$'))
    if bufloaded(b) && !has_key(visible, b)
      let l:tally += 1
      exe 'bw ' . b
    endif
  endfor
  echon "Deleted " . l:tally . " buffers"
endfun

" Grab path and line number in @
nnoremap <leader>y :let @+=expand("%") . ':' . line(".")<CR>

" Grab selected text and ...
vnoremap <leader>y "+y:let @+=@+.expand("%") . ':' . line(".")<CR>

" Set list shortcut
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Allow vimrc editing
nmap <leader>v :tabedit $MYVIMRC<CR>

" Reopen last file in vs
nmap <c-s-t> :vs<bar>:b#<CR>

" Open browser and navigate to file/line under cursor
nnoremap <leader>o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

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
