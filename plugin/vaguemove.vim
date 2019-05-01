scriptencoding utf-8

if exists('g:loaded_vague_move')
    finish
endif
let g:loaded_vague_move = 1

let s:save_cpo = &cpo
set cpo&vim

"" commands
command! -nargs=0 VagueToggleFocusLoclist call vaguemove#LoclistFocusToggle()
command! -nargs=0 VagueToggleOpenLoclist call vaguemove#LoclistOpenToggle()
command! -nargs=0 VagueToggleFocusQuickfix call vaguemove#QuickfixFocusToggle()
command! -nargs=0 VagueToggleOpenQuickfix call vaguemove#QuickfixOpenToggle()
command! -nargs=0 VagueToggleOpenLspHover call vaguemove#LspHoverOpenToggle()
command! -nargs=0 VagueToggleOpenQuickRun call vaguemove#QuickRunOpenToggle()
command! -nargs=0 VagueToggleFocusTagbar call vaguemove#TagbarFocusToggle()
command! -nargs=0 VagueMoveLeft call vaguemove#MoveLeft()
command! -nargs=0 VagueMoveDown call vaguemove#MoveDown()
command! -nargs=0 VagueMoveUp call vaguemove#MoveUp()
command! -nargs=0 VagueMoveRight call vaguemove#MoveRight()

let &cpo = s:save_cpo
unlet s:save_cpo
