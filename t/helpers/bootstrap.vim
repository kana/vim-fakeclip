runtime! plugin/fakeclip.vim
call vspec#hint({
\   'scope': 'fakeclip#_local_variables()',
\   'sid': 'fakeclip#_sid_prefix()',
\ })

command! -nargs=1 ExpectedPlatform  call s:ExpectedPlatform(<q-args>)
function! s:ExpectedPlatform(expected_platform)
  if !(Ref('s:PLATFORM') ==? a:expected_platform ||
  \    a:expected_platform ==# 'any' && Ref('s:PLATFORM') !=# 'unknown')
    SKIP 'not on the platform'
  endif
endfunction

command! -nargs=1 ExpectedMultiplexer  call s:ExpectedMultiplexer(<q-args>)
function! s:ExpectedMultiplexer(expected_multiplexer)
  if index(s:testable_tools, a:expected_multiplexer)
    SKIP 'not in the terminal multiplexer'
  end
endfunction
let s:testable_tools = []
if executable('screen') && $STY != ''
  call add(s:testable_tools, 'screen')
endif
if executable('tmux') && $TMUX != ''
  call add(s:testable_tools, 'tmux')
endif
