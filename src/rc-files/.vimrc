" template for new .lvimrc files
" let root = expand('%:p:h')
" nmap <leader>y :silent execute ':! tmux send-keys -t 2 "cd ' . root . ' ; clear ; 
"             \ docker-machine start default" C-m
"             \'<CR> :redraw!<CR>
"
" const print = i => {console.log(i); return i}
" const printInput = f => i => { console.log(i); return f(i)}
" const printIO = (s, f) => i => { const o=f(i); console.log({s: s, i: i, o: o}); return o}


" skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
endif

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('altercation/vim-colors-solarized')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('benmills/vimux')
    call dein#add('jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}})
    call dein#add('isRuslan/vim-es6')
    call dein#add('scrooloose/nerdtree')
    call dein#add('jistr/vim-nerdtree-tabs')
    call dein#add('EvanDotPro/nerdtree-chmod')
    call dein#add('gaving/vim-textobj-argument')
    call dein#add('Xuyuanp/nerdtree-git-plugin')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-abolish')
    call dein#add('907th/vim-auto-save')
    call dein#add('airblade/vim-gitgutter')
	" call dein#add('codable/diffreview')
    call dein#add('ruanyl/vim-fixmyjs')
    call dein#add('tpope/vim-commentary')
    call dein#add('idbrii/vim-remarkjs')
    call dein#add('idbrii/vim-gogo')
    call dein#add('mhinz/vim-startify')
    call dein#add('tpope/vim-endwise')
    " call dein#add('tpope/vim-rshrestha/async')

    call dein#end()
    call dein#save_state()
endif

" global variables
set textwidth=0
set shell=/usr/bin/zsh
set nobackup
"set laststatus=2
let g:nerdtree_tabs_open_on_console_startup=0
" let g:fieldtrip_start_map=<leader>,
let g:NERDTreeWinSize = 40
let g:auto_save_in_insert_mode = 1
let g:auto_save_silent = 1
let g:auto_save = 1
set ic
set cursorline
set expandtab
set ttimeoutlen=50
set backspace=eol,start,indent
" set whichwrap+=<,>,h,l
set smartcase
set hlsearch
set incsearch
set nowb
let mapleader=" "
let NERDTreeQuitOnOpen = 1
let g:SimpylFold_docstring_preview = 1
set nrformats-=octal
set wildmenu
set wildmode=list:longest
let g:ctrlp_working_path_mode = 0
set shortmess=a
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript']
set cmdheight=1
set ff=unix
set paste
set nomore

" Color scheme
" let g:solarized_termcolors=256
filetype plugin indent on    " required
syntax enable
au BufRead,BufNewFile *.ls set filetype=ls
set background=light
set t_Co=256
colorscheme solarized

" don't wrap at the end of lines
set nowrap
" line width and indentation
set softtabstop=4 shiftwidth=4 tabstop=4
set wrapmargin=0

" mappings
noremap <C-f> :Autoformat<CR> :echo<cr>                                                                                         
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-i> :res +5<CR>
nmap <silent> <C-u> :res -5<CR>
nmap <leader>p :CtrlP<CR>
nmap <leader>o :CtrlPClearCache<CR>
nmap <leader>g :echo ''<CR>
nmap <leader>3 :silent test
map <leader>4 "
map <leader>5 @
" nmap <leader>a :silent call VimuxRunCommand('clear')<CR>
nnoremap <leader>9 :AsyncRun tmux send-keys -t 2 -R !! C-m<cr> :echo<cr>
nnoremap J gJi <esc>dw
nnoremap <leader>0 oconst pio = s => f => (...i) => { console.log(s + ' input'); console.log(...i); const o=f(...i); console.log(s + ' output'); console.log(o); return o}<esc>
nnoremap <leader>8 oconst print = i => {console.log(i); return i}<esc>
nmap <leader>ww :!tw<cr> :echo<cr>
nmap <leader>we :!te<CR> :echo<cr>
" nmap <leader>5 :diffget //2<CR>
" nmap <leader>8 :diffget //3<CR>

" nmap <c-x> :call ToggleComments()<cr>
" nmap <C-w> :sp<CR><C-j>:FSAbove<CR>
nnoremap Y y$
" map /cyg :e /cyg

nmap <leader>f :call Ack()<CR>
function! Ack()
    let command='ack -i "' . getline('.') . '"'
    VimuxRunCommand(command)
endfunction

function! ToggleComments()
    if g:commentsvisible
        let g:commentsvisible=0
        hi! Comment guifg=bg ctermfg=white
    else
        let g:commentsvisible=1
        hi! Comment guifg=bg ctermfg=DarkBlue
    endif
endfunction
let commentsvisible=1
hi! Comment guifg=bg ctermfg=DarkBlue

nmap <leader>h :noh<CR> :echo<cr>                                                                                         
set noshowmatch
au BufEnter * :NoMatchParen
map # <Nop>
" vnoremap <silent> * :call VisualSelection('f')<CR>
" vnoremap <silent> # :call VisualSelection('b')<CR>
" map <silent> <leader><cr> :noh<cr>
map <leader>cd :cd %:p:h<cr>:pwd<cr>

nnoremap <leader>t :NERDTreeTabsToggle<CR> :echo<cr>
let NERDTreeMinimalUI = 1
let NERDTreeStatusline=""

nnoremap <SPACE> <Nop>
" let g:tabman_toggle = '<leader>mt'
" let g:tabman_focus  = '<leader>mf'
nmap <leader>q :so $MYVIMRC<CR> :echo<cr>                                                                                         
" map <leader>, :SidewaysLeft<CR>
" map <leader>. :SidewaysRight<CR>
nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>
nnoremap <silent> gh "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

map <leader>m `a1jmaa

" Mouse
if has("gui_running")
    "echo "yes, we have a GUI"
    set mouse=a
else
    "echo "Boring old console"
    set mouse=
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py call DeleteTrailingWS()
autocmd BufWrite *.coffee call DeleteTrailingWS()

" get rid of annoying temporary files
set undodir=~/.vimundo
set directory=~/.vimundo
set backupdir=~/.vimundo

if filereadable(".lvimrc")
    source .lvimrc
endif

" folding
set foldmethod=syntax
set foldlevelstart=99

syntax region foldBraces start=/{/ end=/}/ transparent fold keepend extend
setlocal foldlevel=99
let javaScript_fold = 99        " JavaScript
let perl_fold = 99              " Perl
let php_folding = 99             " PHP
let r_syntax_folding = 99        " R
let ruby_fold = 99               " Ruby
let sh_fold_enabled = 99         " sh
let vimsyn_folding = 'af'       " Vim script
let xml_syntax_folding = 99     " XML
au FileType javascript call JavaScriptFold()

" hide comments

" highlighting
hi cursorline ctermbg=NONE
hi folded ctermbg=NONE ctermfg=grey cterm=bold

if has("folding")
    set foldtext=MyFoldText()
    function! MyFoldText()
        " for now, just don't try if version isn't 7 or higher
        if v:version < 701
            return foldtext()
        endif
        " clear fold from fillchars to set it up the way we want later
        let &l:fillchars = substitute(&l:fillchars,',\?fold:.','','gi')
        let l:numwidth = (v:version < 701 ? 8 : &numberwidth)
        if &fdm=='diff'
            let l:linetext=''
            let l:foldtext='---------- '.(v:foldend-v:foldstart+1).' blines the same ----------'
            let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strlen(line('$'))+1, l:numwidth) : 0)
            let l:align = (l:align / 2) + (strlen(l:foldtext)/2)
            " note trailing space on next line
            setlocal fillchars+=fold:\
        elseif !exists('b:foldpat') || b:foldpat==0
            " let l:foldtext = ' '.(v:foldend-v:foldstart).' blines folded'.v:folddashes.'|'
            let l:foldtext = ''
            let l:endofline = (&textwidth>0 ? &textwidth : 80)
            let l:linetext = strpart(getline(v:foldstart),0,l:endofline-strlen(l:foldtext))
            let l:align = l:endofline-strlen(l:linetext)
            setlocal fillchars+=fold:
        elseif b:foldpat==1
            let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strlen(line('$'))+1, l:numwidth) : 0)
            let l:foldtext = ' '.v:folddashes
            let l:linetext = substitute(getline(v:foldstart),'\s\+$','','')
            let l:linetext .= ' ---'.(v:foldend-v:foldstart-1).' blines--- '
            let l:linetext .= substitute(getline(v:foldend),'^\s\+','','')
            let l:linetext = strpart(l:linetext,0,l:align-strlen(l:foldtext))
            let l:align -= strlen(l:linetext)
            setlocal fillchars+=fold:-
        endif
        return printf('%s%*s', l:linetext, l:align, l:foldtext)
    endfunction
endif

" " disable simple movements
" function! DisableIfNonCounted(move) range
"     if v:count
"         return a:move
"     else
"         " You can make this do something annoying like:
"            " echoerr "Count required!"
"            " sleep 2
"         return ""
"     endif
" endfunction
" 
" function! SetDisablingOfBasicMotionsIfNonCounted(on)
"     let keys_to_disable = get(g:, "keys_to_disable_if_not_preceded_by_count", ["j", "k", "l", "h"])
"     if a:on
"         for key in keys_to_disable
"             execute "noremap <expr> <silent> " . key . " DisableIfNonCounted('" . key . "')"
"         endfor
"         let g:keys_to_disable_if_not_preceded_by_count = keys_to_disable
"         let g:is_non_counted_basic_motions_disabled = 1
"     else
"         for key in keys_to_disable
"             try
"                 execute "unmap " . key
"             catch /E31:/
"             endtry
"         endfor
"         let g:is_non_counted_basic_motions_disabled = 0
"     endif
" endfunction
" 
" function! ToggleDisablingOfBasicMotionsIfNonCounted()
"     let is_disabled = get(g:, "is_non_counted_basic_motions_disabled", 0)
"     if is_disabled
"         call SetDisablingOfBasicMotionsIfNonCounted(0)
"     else
"         call SetDisablingOfBasicMotionsIfNonCounted(1)
"     endif
" endfunction
" 
" command! ToggleDisablingOfNonCountedBasicMotions :call ToggleDisablingOfBasicMotionsIfNonCounted()
" command! DisableNonCountedBasicMotions :call SetDisablingOfBasicMotionsIfNonCounted(1)
" command! EnableNonCountedBasicMotions :call SetDisablingOfBasicMotionsIfNonCounted(0)
" 
" DisableNonCountedBasicMotions

" large files "
" file is large from 2mb
let g:LargeFile = 1024 * 1024 * 2
augroup LargeFile 
autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END
augroup filetypedetect
 au! BufRead,BufNewFile *.es6       set syntax=javascript
augroup END__

function! LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 " setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

" ultisnips
let g:UltiSnipsExpandTrigger="<C-y>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'UserUltiSnips']

" Highlight ES6 template strings
hi link javaScriptTemplateDelim String
hi link javaScriptTemplateVar Text
hi link javaScriptTemplateString String

" promptline
" let g:promptline_preset = {
"         \'a' : [ '' ],
"         \'x' : [ promptline#slices#cwd() ],
"         \'y' : [ promptline#slices#host({ 'only_if_ssh': 1 })],
"         \'z' : [ promptline#slices#git_status() ],
"         \'warn' : [ promptline#slices#last_exit_code() ]}

map <c-g> :wincmd h<CR>

function! OnFileLoad()
    set foldlevelstart=99
    set foldlevel=99
    map <leader>n :only<CR> :echo<cr>                                                                                         
    set foldcolumn=2
    if exists("#airline")
        AirlineToggle
    endif

    set noro
    call ClearSyntax()

    " let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['es6'] = '6'
    " let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yaml'] = 'y'

    " let g:NERDTreeExtensionHighlightColor['es6'] = 'D4843E'
    " let g:NERDTreeExtensionHighlightColor['yaml'] = 'AE403F'
endfunction
autocmd FileReadPost * call OnFileLoad()
autocmd BufRead * call OnFileLoad()

function! ShrinkBuff()
    let bufferheight = line('$')
    let &wh=bufferheight + 2
endfunction
autocmd BufEnter * call ShrinkBuff()
set wmh=0

function! ShrinkAll()
    let winno=tabpagewinnr(tabpagenr())

    " - go to top
    wincmd k
    wincmd k
    wincmd k
    wincmd k
    wincmd k
    wincmd k
    wincmd k

    " - shrink all to zero
    res -500
    wincmd j
    res -500
    wincmd j
    res -500
    wincmd j
    res -500
    wincmd j
    res -500
    wincmd j
    res -500
    wincmd j
    res -500
    wincmd j
    " - grow bottom to max
    res 500

    " - go to top
    wincmd k
    wincmd k
    wincmd k
    wincmd k
    wincmd k
    wincmd k
    wincmd k

    " - for each on way down, msgg`s
    execute 'normal! msgg`s'
    wincmd j
    execute 'normal! msgg`s'
    wincmd j
    execute 'normal! msgg`s'
    wincmd j
    execute 'normal! msgg`s'
    wincmd j
    execute 'normal! msgg`s'
    wincmd j
    execute 'normal! msgg`s'
    wincmd j
    execute 'normal! msgg`s'
    wincmd j

    execute winno . 'wincmd w'
endfunction
map <leader>2 :call ShrinkAll()<CR> :echo<cr>                                                                                         
autocmd vimenter * call ShrinkAll()
autocmd vimenter * echo     
" autocmd InsertLeave <buffer> call ShrinkAll()
autocmd InsertEnter * set tabline=\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ %=%f
autocmd InsertLeave * set tabline=\ 

hi StatusLineNC ctermbg=white ctermfg=grey cterm=bold
hi StatusLine ctermbg=white ctermfg=grey cterm=bold
hi LineNr cterm=NONE ctermfg=grey ctermbg=NONE gui=NONE guifg=white guibg=white
hi CurrentLineNr cterm=NONE ctermfg=white ctermbg=white gui=NONE guifg=white guibg=white
hi FoldColumn guibg=white guifg=lightgrey ctermfg=white ctermbg=white
hi NonText guifg=white ctermfg=white
set statusline=\ \ \ \ \ \ \ \ -

set ls=0
set tabline=\ 
hi TabLineFill ctermbg=white ctermfg=grey cterm=bold
set showtabline=2
noh
hi VertSplit ctermfg=bg ctermbg=white
set fillchars+=vert:\|
set encoding=utf8

" move cursor by display lines when wrapping
" set columns=94
" autocmd V i m Resized * if (&columns > 94) | set columns=94 | endif
set linebreak

noremap <leader>3 :call ToggleWrap()<CR> :echo<cr>                                                                                         
function! ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        set nowrap
        set virtualedit=all
		silent! nunmap <buffer> <Up>
		silent! nunmap <buffer> <Down>
		silent! nunmap <buffer> <Home>
		silent! nunmap <buffer> <End>
		silent! iunmap <buffer> <Up>
		silent! iunmap <buffer> <Down>
		silent! iunmap <buffer> <Home>
		silent! iunmap <buffer> <End>
    else
		echo "Wrap ON"
        set wrap linebreak nolist
        set virtualedit=all
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>

        noremap  <buffer> <silent> k gk
        noremap  <buffer> <silent> j gj
        noremap  <buffer> <silent> 0 g0
        noremap  <buffer> <silent> $ g$

        onoremap <silent> j gj
        onoremap <silent> k gk
    endif
endfunction

function! FloatUp()
    while line(".") > 1
                \ && (strlen(getline(".")) < col(".")
                \ || getline(".")[col(".") - 1] =~ '\s')
        norm 1k
    endwhile
endfunction
nnoremap gU :call FloatUp()<CR> :echo<cr>                                                                                         

function! FloatDown()
    while line(".") > 1
                \ && (strlen(getline(".")) < col(".")
                \ || getline(".")[col(".") - 1] =~ '\s')
        norm 1j
    endwhile
endfunction
nnoremap gD :call FloatDown()<CR> :echo<cr>                                                                                         

" Show syntax highlighting groups for word under cursor
nmap <leader>o :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
hi lsKey ctermfg=darkcyan
hi lsPunc ctermfg=darkgreen cterm=bold

function! Realpath()
    let new_path = "sp " . system('realpath ' . expand("%"))
    execute "bw"
    execute new_path
endfunc
nnoremap <leader>r :call Realpath()<CR> :echo<cr>                                                                                         
nnoremap <leader>x //e<CR>ld??a<CR>
nnoremap <expr> n 'Nn'[v:searchforward] . 'zv'
nnoremap <expr> N 'nN'[v:searchforward] . 'zv'

function! Strip(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction
" nnoremap <leader>b :call VimuxRunCommand(Strip(getline('.')))<CR> :echo<cr>                                                                                         

function! Explore()
    echo system('/home/docker-dev/src/other/explore.bash ' . expand("%:p:h"))
endfunc
nnoremap <leader>e :call Explore()<CR> :echo<cr>                                                                                         

set laststatus=2
set noruler
set noshowmode
set noswapfile

set notimeout
set ttimeout

nnoremap ' "
nnoremap cd /\%<C-R>=virtcol(".")<CR>v\S<CR>:noh<CR>
nnoremap cu ?\%<C-R>=virtcol(".")<CR>v\S<CR>:noh<CR>

" highlight only comments
func! ClearSyntax()
    let syn=split(execute('syn list'), "\n")[1:]
    call filter(syn, {idx, val -> match(val, '^\w') > -1})
    call map(syn, {idx, val -> split(val)[0]})
    for item in syn
        if match(item, '\c\mcomment') == -1
            try
                exe 'syn clear' item
                " ignore E28 (no such highlight group)
            catch /^Vim\%((\a\+)\)\=:E28/
            endtry
        endif
    endfor
    highlight Normal ctermfg=0
    highlight Comment ctermfg=Grey
    highlight VimwikiHeader1 ctermfg=Grey
    highlight VimwikiHeader2 ctermfg=Grey
    highlight VimwikiHeader3 ctermfg=Grey
    highlight VimwikiHeader4 ctermfg=Grey
    highlight VimwikiHeader5 ctermfg=Grey
    highlight VimwikiHeader6 ctermfg=Grey
    highlight Visual ctermbg=DarkBlue ctermfg=White
    highlight SignColumn ctermfg=White ctermbg=White
    highlight GitGutterAdd ctermfg=Grey ctermbg=White
    highlight GitGutterChange ctermfg=Grey ctermbg=White
    highlight GitGutterDelete ctermfg=Grey ctermbg=White
    highlight GitGutterChangeDelete ctermfg=Grey ctermbg=White
endfu
call ClearSyntax()
set virtualedit=all

" com! ClearSyntaxExceptComments :call ClearSyntax()

let g:gitgutter_sign_added = '| '
let g:gitgutter_sign_modified = '| '
let g:gitgutter_sign_removed = '| '
let g:gitgutter_sign_removed_first_line = '| '
let g:gitgutter_sign_modified_removed = '| '
let g:gitgutter_override_sign_column_highlight = 0

set autoread
au CursorHold * checktime
set switchbuf=useopen,usetab

let root = expand('%:p:h')
" nnoremap <leader>y :silent execute ':! tmux send-keys -t 2 "cd ' . root . '
"     \ ; clear ; bash dev.sh --file-path ' . split(expand('%:p'), root . '/')[0]
"     \ . ' --command list" C-m'<CR> :redraw!<CR> :echo<cr>                                                                                         
" nnoremap <leader>u :silent execute ':! tmux send-keys -t 2 "cd ' . root . '
"     \ ; clear ; bash dev.sh --file-path ' . split(expand('%:p'), root . '/')[0]
"     \ . ' --command 1" C-m'<CR> :redraw!<CR> :echo<cr>                                                                                         
" nnoremap <leader>i :silent execute ':! tmux send-keys -t 2 "cd ' . root . '
"     \ ; clear ; bash dev.sh --file-path ' . split(expand('%:p'), root . '/')[0]
"     \ . ' --command 2" C-m'<CR> :redraw!<CR> :echo<cr>                                                                                         
" nnoremap <leader>o :silent execute ':! tmux send-keys -t 2 "cd ' . root . '
"     \ ; clear ; bash dev.sh --file-path ' . split(expand('%:p'), root . '/')[0]
"     \ . ' --command 3" C-m'<CR> :redraw!<CR> :echo<cr>                                                                                         
" nnoremap <leader>p :silent execute ':! tmux send-keys -t 2 "cd ' . root . '
"     \ ; clear ; bash dev.sh --file-path ' . split(expand('%:p'), root . '/')[0]
"     \ . ' --command 4" C-m'<CR> :redraw!<CR> :echo<cr>                                                                                         
" nnoremap <leader>j :silent execute ':! tmux send-keys -t 2 "cd ' . root . '
"     \ ; clear ; bash dev.sh --file-path ' . split(expand('%:p'), root . '/')[0]
"     \ . ' --command 5" C-m'<CR> :redraw!<CR> :echo<cr>                                                                                         
" nnoremap <leader>k :silent execute ':! tmux send-keys -t 2 "cd ' . root . '
"     \ ; clear ; bash dev.sh --file-path ' . split(expand('%:p'), root . '/')[0]
"     \ . ' --command 6" C-m'<CR> :redraw!<CR> :echo<cr>                                                                                         
" nnoremap <leader>l :silent execute ':! tmux send-keys -t 2 "cd ' . root . '
"     \ ; clear ; bash dev.sh --file-path ' . split(expand('%:p'), root . '/')[0]
"     \ . ' --command 7" C-m'<CR> :redraw!<CR> :echo<cr>                                                                                         
" nnoremap <leader>m :silent execute ':! tmux send-keys -t 2 "cd ' . root . '
"     \ ; clear ; bash dev.sh --file-path ' . split(expand('%:p'), root . '/')[0]
"     \ . ' --command 8" C-m'<CR> :redraw!<CR> :echo<cr>                                                                                         
" nnoremap <leader>, :silent execute ':! tmux send-keys -t 2 "cd ' . root . '
"     \ ; clear ; bash dev.sh --file-path ' . split(expand('%:p'), root . '/')[0]
"     \ . ' --command 10" C-m'<CR> :redraw!<CR> :echo<cr>                                                                                         
" nnoremap <leader>. :silent execute ':! tmux send-keys -t 2 "cd ' . root . '
"     \ ; clear ; bash dev.sh --file-path ' . split(expand('%:p'), root . '/')[0]
"     \ . ' --command 11" C-m'<CR> :redraw!<CR> :echo<cr>                                                                                         
nnoremap <leader>. :! tmux send-keys -t 2 --command "!!"'<cr>
" :echo<cr>                                                                                         
nmap <leader>. :silent execute ':! tmux send-keys -t 2 "
            \ \!\!" Enter'<CR> :redraw!<CR>

" nnoremap <C-c> "*y
" nnoremap <C-v> "*p

highlight Search cterm=NONE ctermfg=DarkBlue ctermbg=White
highlight IncSearch cterm=NONE ctermfg=White ctermbg=DarkBlue
let g:gitgutter_map_keys = 0

set winheight=5
set winminheight=5

func! STL()
  let stl = ''
  let barWidth = 80
  let barWidth = barWidth < 3 ? 3 : barWidth

  if line('$') > 1
    let progress = (line('.')-1) * (barWidth-1) / (line('$')-1)
  else
    let progress = barWidth/2
  endif

  " line + vcol + %
  let pad = 0
  let bar = repeat(' ',pad).'   %1*%'.barWidth.'.'.barWidth.'('
        \.repeat(' ',progress )
        \.' '
        \.repeat(' ',barWidth - progress - 1).'%0*%)%<.                                                                                                                                '
        "\.'%2*.%1*'

  " return '<.'
  return stl.bar
endfun

hi def link User1 DiffAdd
hi def link User2 DiffDelete
set stl=%!STL()

 let g:startify_lists = [
        \ { 'type': 'dir',
            \ 'footer': ['', '', '', '', '', '', ''] }
\ ]                   
let g:startify_custom_footer = ''
let g:startify_files_number = 0
let g:startify_enable_special = 0
let g:startify_custom_header = ['', '', '', '', '']
let g:startify_change_to_dir = 0
autocmd User Startified let &l:stl = ''

" redirect the output of a Vim or external command into a scratch buffer
function! Redir(cmd)
  if a:cmd =~ '^!'
    execute "let output = system('" . substitute(a:cmd, '^!', '', '') . "')"
  else
    redir => output
    execute a:cmd
    redir END
  endif
  tabnew
  setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
  call setline(1, split(output, "\n"))
  put! = a:cmd
  put = '----'
endfunction
command! -nargs=1 Redir silent call Redir(<f-args>)

let g:AutoClosePumvisible = {"ENTER": "", "ESC": ""}

let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
end
