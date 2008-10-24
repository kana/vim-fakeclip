" fakeclip - pseude clipboard register for non-GUI version of Vim
" Version: 0.2.1
" Copyright (C) 2007-2008 kana <http://whileimautomaton.net/>
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
" Prologue  "{{{1

if exists('g:loaded_fakeclip') || has('clipboard')
  finish
endif








" Key Mappings  "{{{1
" Interface key mappings  "{{{2

nnoremap <silent> <Plug>(fakeclip-y)
\ :<C-u>set operatorfunc=fakeclip#clipboard_yank<Return>g@
vnoremap <silent> <Plug>(fakeclip-y)
\ :<C-u>call fakeclip#yank('clipboard', visualmode())<Return>
nnoremap <silent> <Plug>(fakeclip-Y)
\ :<C-u>call fakeclip#yank_Y('clipboard')<Return>
vnoremap <silent> <Plug>(fakeclip-Y)
\ :<C-u>call fakeclip#yank('clipboard', 'V')<Return>

nnoremap <silent> <Plug>(fakeclip-p)
\ :<C-u>call fakeclip#put('clipboard', '', 'p')<Return>
nnoremap <silent> <Plug>(fakeclip-P)
\ :<C-u>call fakeclip#put('clipboard', '', 'P')<Return>
nnoremap <silent> <Plug>(fakeclip-gp)
\ :<C-u>call fakeclip#put('clipboard', '', 'gp')<Return>
nnoremap <silent> <Plug>(fakeclip-gP)
\ :<C-u>call fakeclip#put('clipboard', '', 'gP')<Return>
vnoremap <silent> <Plug>(fakeclip-p)
\ :<C-u>call fakeclip#put('clipboard', visualmode(), 'p')<Return>
vnoremap <silent> <Plug>(fakeclip-P)
\ :<C-u>call fakeclip#put('clipboard', visualmode(), 'P')<Return>
vnoremap <silent> <Plug>(fakeclip-gp)
\ :<C-u>call fakeclip#put('clipboard', visualmode(), 'gp')<Return>
vnoremap <silent> <Plug>(fakeclip-gP)
\ :<C-u>call fakeclip#put('clipboard', visualmode(), 'gP')<Return>

inoremap <Plug>(fakeclip-insert)  <C-r>=fakeclip#content('clipboard')<Return>
cnoremap <Plug>(fakeclip-insert)  <C-r>=fakeclip#content('clipboard')<Return>


nnoremap <silent> <Plug>(fakeclip-screen-y)
\ :<C-u>set operatorfunc=fakeclip#screen_yank<Return>g@
vnoremap <silent> <Plug>(fakeclip-screen-y)
\ :<C-u>call fakeclip#yank('screen', visualmode())<Return>
nnoremap <silent> <Plug>(fakeclip-screen-Y)
\ :<C-u>call fakeclip#yank_Y('screen')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-Y)
\ :<C-u>call fakeclip#yank('screen', 'V')<Return>

nnoremap <silent> <Plug>(fakeclip-screen-p)
\ :<C-u>call fakeclip#put('screen', '', 'p')<Return>
nnoremap <silent> <Plug>(fakeclip-screen-P)
\ :<C-u>call fakeclip#put('screen', '', 'P')<Return>
nnoremap <silent> <Plug>(fakeclip-screen-gp)
\ :<C-u>call fakeclip#put('screen', '', 'gp')<Return>
nnoremap <silent> <Plug>(fakeclip-screen-gP)
\ :<C-u>call fakeclip#put('screen', '', 'gP')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-p)
\ :<C-u>call fakeclip#put('screen', visualmode(), 'p')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-P)
\ :<C-u>call fakeclip#put('screen', visualmode(), 'P')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-gp)
\ :<C-u>call fakeclip#put('screen', visualmode(), 'gp')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-gP)
\ :<C-u>call fakeclip#put('screen', visualmode(), 'gP')<Return>

inoremap <Plug>(fakeclip-screen-insert)
\ <C-r>=fakeclip#content('screen')<Return>
cnoremap <Plug>(fakeclip-screen-insert)
\   <C-r>=fakeclip#content('screen')<Return>




" Default key mappings  "{{{2

command! -bang -bar -nargs=0 FakeclipDefaultKeyMappings
\ call s:cmd_FakeclipDefaultKeyMappings()

function! s:cmd_FakeclipDefaultKeyMappings()
  " Clipboard
  for _ in ['+', '*']
    execute 'nmap "'._.'y  <Plug>(fakeclip-y)'
    execute 'nmap "'._.'Y  <Plug>(fakeclip-Y)'
    execute 'nmap "'._.'yy  <Plug>(fakeclip-Y)'
    execute 'vmap "'._.'y  <Plug>(fakeclip-y)'
    execute 'vmap "'._.'Y  <Plug>(fakeclip-Y)'

    execute 'nmap "'._.'p  <Plug>(fakeclip-p)'
    execute 'nmap "'._.'P  <Plug>(fakeclip-P)'
    execute 'nmap "'._.'gp  <Plug>(fakeclip-gp)'
    execute 'nmap "'._.'gP  <Plug>(fakeclip-gP)'
    execute 'vmap "'._.'p  <Plug>(fakeclip-p)'
    execute 'vmap "'._.'P  <Plug>(fakeclip-P)'
    execute 'vmap "'._.'gp  <Plug>(fakeclip-gp)'
    execute 'vmap "'._.'gP  <Plug>(fakeclip-gP)'

    execute 'imap <C-r>'._.'  <Plug>(fakeclip-insert)'
    execute 'cmap <C-r>'._.'  <Plug>(fakeclip-insert)'
  endfor

  " GNU screen
  nmap "&y  <Plug>(fakeclip-screen-y)
  nmap "&Y  <Plug>(fakeclip-screen-Y)
  nmap "&yy  <Plug>(fakeclip-screen-Y)
  vmap "&y  <Plug>(fakeclip-screen-y)
  vmap "&Y  <Plug>(fakeclip-screen-Y)

  nmap "&p  <Plug>(fakeclip-screen-p)
  nmap "&P  <Plug>(fakeclip-screen-P)
  nmap "&gp  <Plug>(fakeclip-screen-gp)
  nmap "&gP  <Plug>(fakeclip-screen-gP)
  vmap "&p  <Plug>(fakeclip-screen-p)
  vmap "&P  <Plug>(fakeclip-screen-P)
  vmap "&gp  <Plug>(fakeclip-screen-gp)
  vmap "&gP  <Plug>(fakeclip-screen-gP)

  imap <C-r>&  <Plug>(fakeclip-screen-insert)
  cmap <C-r>&  <Plug>(fakeclip-screen-insert)
endfunction

if !exists('g:fakeclip_no_default_key_mappings')
  FakeclipDefaultKeyMappings
endif








" Epilogue  "{{{1

let g:loaded_fakeclip = 1








" __END__  "{{{1
" vim: foldmethod=marker foldlevel=0
