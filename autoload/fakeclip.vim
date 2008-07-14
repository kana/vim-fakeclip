" fakeclip - pseude clipboard register for non-GUI version of Vim
" Version: 0.2.0
" Copyright (C) 2008 kana <http://whileimautomaton.net/>
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
" Platform detection  "{{{1

if exists('macunix') || system('uname -o') =~? '^darwin'
  let s:PLATFORM = 'mac'
elseif exists('win32unix')
  let s:PLATFORM = 'cygwin'
else
  let s:PLATFORM = 'unknown'
endif








" Interface  "{{{1
function! fakeclip#yank(motion_type)
  let r0 = s:save_register('0')

  call s:select_last_motion(a:motion_type)
  normal! y
  call s:yank_into_clipboard(@@)

  call s:restore_register('0', r0)
endfunction

function! fakeclip#yank_Y()
  let diff = s:count() - 1
  normal! V
  if 0 < diff
    execute 'normal!' diff.'j'
  endif
  execute "normal \<Plug>(fakeclip-Y)"
endfunction


function! fakeclip#put(motion_type, put_type)
  let r_ = s:save_register('"')
  let @@ = fakeclip#content()

  if a:motion_type == ''
    execute 'normal!' s:count().a:put_type
    call s:restore_register('"', r_)
  else
    call s:select_last_motion(a:motion_type)
    execute 'normal!' s:count().a:put_type
  endif
endfunction


function! fakeclip#content()
  if s:PLATFORM ==# 'cygwin'
    let content = ''
    for line in readfile('/dev/clipboard', 'b')
      let content = content . "\x0A" . substitute(line, "\x0D", '', 'g')
    endfor
    return content[1:]
  else
    echoerr 'Getting the clipboard content is not supported on this platform.'
    return ''
  endif
endfunction








" Misc.  "{{{1

function! s:select_last_motion(motion_type)
  let orig_selection = &selection
  let &selection = 'inclusive'

  if a:motion_type == 'char'
    normal! `[v`]
  elseif a:motion_type == 'line'
    normal! '[V']
  elseif a:motion_type == 'block'
    execute "normal! `[\<C-v>`]"
  else  " invoked from visual mode
    normal! gv
  endif

  let &selection = orig_selection
endfunction


function! s:count()
  " true#
  return (v:count == v:count1) ? v:count : ''
endfunction


function! s:save_register(regname)
  " true#
  return [getreg(a:regname), getregtype(a:regname)]
endfunction

function! s:restore_register(regname, reginfo)
  " true#
  call setreg(a:regname, a:reginfo[0], a:reginfo[1])
  return
endfunction


function! s:yank_into_clipboard(text)
  if s:PLATFORM ==# 'cygwin'
    call writefile(split(a:text, "\x0A", 1), '/dev/clipboard', 'b')
  else
    echoerr 'Yanking into the clipboard is not supported on this platform.'
  endif
endfunction








" __END__  "{{{1
" vim: foldmethod=marker
