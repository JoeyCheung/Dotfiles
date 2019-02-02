if exists('g:loaded_typing_sound')
  finish
endif
let g:loaded_typing_sound = 1

let s:save_cpo = &cpo
set cpo&vim

call typing_sound#init()

command! TypingSound call typing_sound#toggle()

autocmd InsertCharPre * call typing_sound#play()

let &cpo = s:save_cpo
unlet s:save_cpo
