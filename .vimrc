"============================================================
" This file setting for VIM usage
"============================================================

"______________________________
" Basic settings
set ignorecase
set nocompatible
set bs=2
set nu
set wrap
"set cul
"set cuc
set mouse=a
set ai
filetype on
syntax on
set hlsearch incsearch
highlight   Search        term=reverse     ctermbg=208  guibg=Yellow
set ruler
set showmode
set showcmd
inoremap <C-s> <esc>:w<cr>a
nnoremap <C-s> :w<cr>a

"______________________________
" Indent
set tabstop=8     " tabs are at proper location
set expandtab     " don't use actual tab character (ctrl-v)
set shiftwidth=4  " indenting is 4 spaces
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs
set cindent       " stricter rules for C programs

"______________________________
" Auto remember the previous cursor position
au BufRead    *   if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

"______________________________
" Highlight
        " Use "hi" to display highlight group
        " Color for diff
        se t_Co=256
	"highlight DiffText term=reverse cterm=bold,underline ctermbg=15
	"highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
	"highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
	"highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
	"highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
	highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
	highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
	highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
	highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

        " Color for Search
        "highlight Search term=reverse ctermbg=14
        highlight Search term=reverse ctermbg=Yellow
        " highlight Search term=reverse ctermbg=red

        " Color for cursorline
        highlight CursorLine  cterm=NONE ctermbg=250
        "se Cursorline

        " Color for syntax highlight
        syntax on

        " SystemC highlight
        "autocmd BufRead,BufNewFile *.cpp se ft=systemc

"______________________________
" Programming header
iabbrev _header_    #>>>>>>>>1>>>>>>>>>2>>>>>>>>>3>>>>>>>>>4>>>>>>>>>5>>>>>>>>>6>>>>>>>>>7>>>>>>>>>8<cr>
                    \#<cr>
                    \# File name   : <cr>
                    \# Revision    : 1.0<cr>
                    \# Author      : Chuong Le (chuong@gmail.com)<cr>
                    \#               LHC Co., Ltd.<cr>
                    \# Description : <cr>
                    \# History     :<cr>
                    \#   v1.0      : Initial version<cr>
                    \#<cr>
                    \#<<<<<<<<1<<<<<<<<<2<<<<<<<<<3<<<<<<<<<4<<<<<<<<<5<<<<<<<<<6<<<<<<<<<7<<<<<<<<<8<cr>
                    \<cr><C-R>=Eatchar('\s')<CR>

" Adding CPP debugging info
iabbrev _deb_ printf("[%s][%s: %d][%s] XXX\n", sc_time_stamp().to_string().c_str(), __FILE__, __LINE__, __FUNCTION__);

"______________________________
" Adding 32 NOP command in SHX
iabbrev _nop_    .arepeat 32<cr>
                   \NOP<cr>
                   \.aendr<cr>
                   \<C-R>=Eatchar('\s')

"______________________________
" Eat 1 character (pat) from user's input, useful in abbreviation
function! Eatchar(pat)
     let c = nr2char(getchar(0))
     return (c =~ a:pat) ? '' : c
endfunction

"______________________________
" Set file type automatically
au BufNewFile,BufRead   *.h 			set filetype=c

"______________________________
" Function keys mapped
map <F2>  :<ESC>:w!<ESC>
"if (@% =~ "[\.]src$" || @% =~ "[\.]ms$" ||  @% =~ "[\.]asm$" ||  @% =~ "[\.]inc$" )     "if file is *.src or *.ms or *.asm
if (@% =~ "[\.]c$" || @% =~ "[\.]cpp$")     "if file is *.src or *.ms or *.asm
    set ft=c
    map <F1> :<ESC>0i// chuongle <ESC>"=strftime('%d%b%y ')<C-M>pj
    map <F3> :<ESC><Home>xxxxxxxxxxxxxxxxxxxx<ESC>j 
"elseif (@% =~ "_RTL_LIST$")
elseif (@% =~ "[\.]py$" || @% =~ "[\.]csh$")
    set ft=c
    map <F1> :<ESC>0i# chuongle <ESC>"=strftime('%d%b%y ')<C-M>pj
    map <F3> :<ESC><Home>xxxxxxxxxxxxxxxxxxxx<ESC>j 
"   map <F5> :<ESC><End>a -simvopt +vpd<ESC>j
"   map <F6> :<ESC><End>xxxxxxxxxxxxxj 
endif
"map <F3>  :<ESC>:w!<ESC>i
"map <F4> :<ESC><C-W>w<ESC>
"map <F7> :<ESC>:set mouse=i<ESC>    
"map <F8> :<ESC>:set mouse=a<ESC> 
map <F9>  :<ESC>:set wrap<ESC>
map <F10> :<ESC>:set nowrap<ESC>
"map <F11> :<ESC>:q<ESC>
map <F12> :<ESC>:q<ESC>

"______________________________
" 8 great vim mappings (https://hashrocket.com/blog/posts/8-great-vim-mappings)
" Toggle paste mode
set pastetoggle=<f5>
" Quit files
noremap ,q :q<cr>
" Save file
nnoremap ,s :w<cr>
inoremap ,s <C-c>:w<cr>

"______________________________
" Commenting blocks of code
"autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
"autocmd FileType sh,ruby,python   let b:comment_leader = '# '
"autocmd FileType conf,fstab       let b:comment_leader = '# '
"autocmd FileType tex              let b:comment_leader = '% '
"autocmd FileType mail             let b:comment_leader = '> '
"autocmd FileType vim              let b:comment_leader = '" '
"noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
