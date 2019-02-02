function! typing_sound#init()
  let g:vim_typing_sound = get(g:, 'vim_typing_sound', 0)
  let g:vim_typing_sound_path = get(g:, 'vim_typing_sound_path', '')
  if !exists('g:vim_typing_sound_command')
    if executable('aplay')
      let g:vim_typing_sound_command = 'aplay -q'
    elseif executable('afplay')
      let g:vim_typing_sound_command = 'afplay'
    else
      let g:vim_typing_sound_command = ''
    endif
  endif
endfunction

function! typing_sound#toggle()
  let g:vim_typing_sound = (g:vim_typing_sound + 1) % 2
endfunction

function! typing_sound#play()
  if g:vim_typing_sound == 0 ||
        \ empty(g:vim_typing_sound_command) ||
        \ empty(g:vim_typing_sound_path)
    return
  endif
  let cmd = g:vim_typing_sound_command . ' ' . g:vim_typing_sound_path
  if exists('g:loaded_vimproc') && g:loaded_vimproc == 1
    call vimproc#system_bg(cmd)
  else
    silent! exec '!' . cmd . ' &'
  endif
endfunction
