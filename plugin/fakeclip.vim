" fakeclip - pseude clipboard register for non-GUI version of Vim
" Version: 0.2.0
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
\ :<C-u>set operatorfunc=fakeclip#yank<Return>g@
vnoremap <silent> <Plug>(fakeclip-y)
\ :<C-u>call fakeclip#yank(visualmode())<Return>
nnoremap <silent> <Plug>(fakeclip-Y)
\ :<C-u>call fakeclip#yank_Y()<Return>
vnoremap <silent> <Plug>(fakeclip-Y)
\ :<C-u>call fakeclip#yank('V')<Return>

nnoremap <silent> <Plug>(fakeclip-p)
\ :<C-u>call fakeclip#put('', 'p')<Return>
nnoremap <silent> <Plug>(fakeclip-P)
\ :<C-u>call fakeclip#put('', 'P')<Return>
nnoremap <silent> <Plug>(fakeclip-gp)
\ :<C-u>call fakeclip#put('', 'gp')<Return>
nnoremap <silent> <Plug>(fakeclip-gP)
\ :<C-u>call fakeclip#put('', 'gP')<Return>
vnoremap <silent> <Plug>(fakeclip-p)
\ :<C-u>call fakeclip#put(visualmode(), 'p')<Return>
vnoremap <silent> <Plug>(fakeclip-P)
\ :<C-u>call fakeclip#put(visualmode(), 'P')<Return>
vnoremap <silent> <Plug>(fakeclip-gp)
\ :<C-u>call fakeclip#put(visualmode(), 'gp')<Return>
vnoremap <silent> <Plug>(fakeclip-gP)
\ :<C-u>call fakeclip#put(visualmode(), 'gP')<Return>

inoremap <Plug>(fakeclip-insert)  <C-r>=fakeclip#content()<Return>
cnoremap <Plug>(fakeclip-insert)  <C-r>=fakeclip#content()<Return>




" Default key mappings  "{{{2

command! -bang -bar -nargs=0 FakeclipDefaultKeyMappings
\ call s:cmd_FakeclipDefaultKeyMappings()

function! s:cmd_FakeclipDefaultKeyMappings()
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
endfunction

if !exists('g:fakeclip_no_default_key_mappings')
  FakeclipDefaultKeyMappings
endif








" Epilogue  "{{{1

let g:loaded_fakeclip = 1








" __END__  "{{{1
" vim: foldmethod=marker foldlevel=0
