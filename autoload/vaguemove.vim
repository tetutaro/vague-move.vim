scriptencoding utf-8

if !exists('g:loaded_vague_move')
    finish
endif
let g:loaded_vague_move = 1

let s:save_cpo = &cpo
set cpo&vim

"" functions of location-list and quickfix

" get winnr of Loclist
function! vaguemove#GetLoclistWinNR()
    for i in range(1, winnr('$'))
        let dict = getwininfo(win_getid(i))
        if len(dict) > 0 && get(dict[0], 'quickfix', 0) && get(dict[0], 'loclist', 0)
            return i
        endif
    endfor
    return 0
endfunction

" get winnr of Quickfix
function! vaguemove#GetQuickfixWinNR()
    for i in range(1, winnr('$'))
        let dict = getwininfo(win_getid(i))
        if len(dict) > 0 && get(dict[0], 'quickfix', 0) && !get(dict[0], 'loclist', 0)
            return i
        endif
    endfor
    return 0
endfunction

" toggle focus between Loclist and normal window
function! vaguemove#LoclistFocusToggle()
    let i = vaguemove#GetLoclistWinNR()
    if i == 0
        :lopen
    else
        if i == winnr()
            exec "wincmd p"
        else
            exec "lopen"
        endif
    endif
endfunction

" toggle open/close Loclist
function! vaguemove#LoclistOpenToggle()
    let i = vaguemove#GetLoclistWinNR()
    :echo i
    if i == 0
        exec "lopen"
    else
        exec "lclose"
    endif
endfunction

" toggle focus between Loclist and normal window
function! vaguemove#QuickfixFocusToggle()
    let i = vaguemove#GetQuickfixWinNR()
    if i == 0
        exec "copen"
    else
        if i == winnr()
            exec "wincmd p"
        else
            exec "copen"
        endif
    endif
endfunction

" toggle open/close Quickfix
function! vaguemove#QuickfixOpenToggle()
    let i = vaguemove#GetQuickfixWinNR()
    if i == 0
        exec "copen"
    else
        exec "cclose"
    endif
endfunction

"" functions of lsp-hover
"" depends on 'prabirshrestha/vim-lsp'
"" https://github.com/prabirshrestha/vim-lsp

" get winnr of LspHover window
function! vaguemove#GetLspHoverWinNR()
    for i in range(1, winnr('$'))
        let ft = getwinvar(i, '&filetype')
        if ft == 'markdown.lsp-hover'
            return i
        endif
    endfor
    return 0
endfunction

" toggle open/close LspHover
function! vaguemove#LspHoverOpenToggle()
    let i = vaguemove#GetLspHoverWinNR()
    if i == 0
        exec "LspHover"
    else
        exec i . "close"
    endif
endfunction

"" functions of quickrun
"" depends on 'thinca/vim-quickrun'
"" https://github.com/thinca/vim-quickrun

" get winnr of QuickRun window
function! vaguemove#GetQuickRunWinNR()
    for i in range(1, winnr('$'))
        let ft = getwinvar(i, '&filetype')
        if ft == 'quickrun'
            return i
        endif
    endfor
    return 0
endfunction

" toggle open/close QuickRun
function! vaguemove#QuickRunOpenToggle()
    let i = vaguemove#GetQuickRunWinNR()
    if i == 0
        exec "QuickRun"
    else
        exec i . "close"
    endif
endfunction

"" functions of tagbar
"" functions of tagbar
"" depends on 'majutsushi/tagbar'
"" https://github.com/majutsushi/tagbar

" toggle focus between Tagbar and normal window
function! vaguemove#TagbarFocusToggle()
    if &filetype == 'tagbar'
        exec "wincmd p"
    else
        exec "TagbarOpen j"
    endif
endfunction

"" functions of vague movement
"" move between tag / window / buffer

" move left vaguely
function! vaguemove#MoveLeft()
    let n = tabpagenr('$')
    if n > 1
        exec "tabprevious"
    else
        let w = winnr('$')
        if w > 1
            exec "wincmd h"
        else
            exec "bprevious"
        endif
    endif
endfunction

" move down vaguely
function! vaguemove#MoveDown()
    let n = tabpagenr('$')
    if n > 1
        exec "tabfirst"
    else
        let w = winnr('$')
        if w > 1
            exec "wincmd j"
        else
            exec "bfirst"
        endif
    endif
endfunction

" move up vaguely
function! vaguemove#MoveUp()
    let n = tabpagenr('$')
    if n > 1
        exec "tablast"
    else
        let w = winnr('$')
        if w > 1
            exec "wincmd k"
        else
            exec "blast"
        endif
    endif
endfunction

" move right vaguely
function! vaguemove#MoveRight()
    let n = tabpagenr('$')
    if n > 1
        exec "tabnext"
    else
        let w = winnr('$')
        if w > 1
            exec "wincmd l"
        else
            exec "bnext"
        endif
    endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
