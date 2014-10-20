" fakeclip - Provide pseudo "clipboard" registers
" Version: 0.3.0
" Copyright (C) 2007-2014 Kana Natsuno <http://whileimautomaton.net/>
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

if exists('g:loaded_fakeclip')
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
nnoremap <silent> <Plug>(fakeclip-]p)
\ :<C-u>call fakeclip#put('clipboard', '', ']p')<Return>
nnoremap <silent> <Plug>(fakeclip-]P)
\ :<C-u>call fakeclip#put('clipboard', '', ']P')<Return>
nnoremap <silent> <Plug>(fakeclip-[p)
\ :<C-u>call fakeclip#put('clipboard', '', '[p')<Return>
nnoremap <silent> <Plug>(fakeclip-[P)
\ :<C-u>call fakeclip#put('clipboard', '', '[P')<Return>
vnoremap <silent> <Plug>(fakeclip-p)
\ :<C-u>call fakeclip#put('clipboard', visualmode(), 'p')<Return>
vnoremap <silent> <Plug>(fakeclip-P)
\ :<C-u>call fakeclip#put('clipboard', visualmode(), 'P')<Return>
vnoremap <silent> <Plug>(fakeclip-gp)
\ :<C-u>call fakeclip#put('clipboard', visualmode(), 'gp')<Return>
vnoremap <silent> <Plug>(fakeclip-gP)
\ :<C-u>call fakeclip#put('clipboard', visualmode(), 'gP')<Return>
vnoremap <silent> <Plug>(fakeclip-]p)
\ :<C-u>call fakeclip#put('clipboard', visualmode(), ']p')<Return>
vnoremap <silent> <Plug>(fakeclip-]P)
\ :<C-u>call fakeclip#put('clipboard', visualmode(), ']P')<Return>
vnoremap <silent> <Plug>(fakeclip-[p)
\ :<C-u>call fakeclip#put('clipboard', visualmode(), '[p')<Return>
vnoremap <silent> <Plug>(fakeclip-[P)
\ :<C-u>call fakeclip#put('clipboard', visualmode(), '[P')<Return>

noremap! <Plug>(fakeclip-insert)
\ <C-r>=fakeclip#content('clipboard')<Return>
noremap! <Plug>(fakeclip-insert-r)
\ <C-r><C-r>=fakeclip#content('clipboard')<Return>
noremap! <Plug>(fakeclip-insert-o)
\ <C-r><C-o>=fakeclip#content('clipboard')<Return>
inoremap <Plug>(fakeclip-insert-p)
\ <C-r><C-p>=fakeclip#content('clipboard')<Return>

nnoremap <silent> <Plug>(fakeclip-d)
\ :<C-u>set operatorfunc=fakeclip#clipboard_delete<Return>g@
vnoremap <silent> <Plug>(fakeclip-d)
\ :<C-u>call fakeclip#delete('clipboard', visualmode())<Return>
nnoremap <silent> <Plug>(fakeclip-dd)
\ :<C-u>set operatorfunc=fakeclip#clipboard_delete<Return>g@g@
nnoremap <silent> <Plug>(fakeclip-D)
\ :<C-u>set operatorfunc=fakeclip#clipboard_delete<Return>g@$
vnoremap <silent> <Plug>(fakeclip-D)
\ :<C-u>call fakeclip#delete('clipboard', 'V')<Return>


" begin XXX
if fakeclip#should_distinguish_primary_and_clipboard()
nnoremap <silent> <Plug>(fakeclip-primary-y)
\ :<C-u>set operatorfunc=fakeclip#primary_yank<Return>g@
vnoremap <silent> <Plug>(fakeclip-primary-y)
\ :<C-u>call fakeclip#yank('primary', visualmode())<Return>
nnoremap <silent> <Plug>(fakeclip-primary-Y)
\ :<C-u>call fakeclip#yank_Y('primary')<Return>
vnoremap <silent> <Plug>(fakeclip-primary-Y)
\ :<C-u>call fakeclip#yank('primary', 'V')<Return>

nnoremap <silent> <Plug>(fakeclip-primary-p)
\ :<C-u>call fakeclip#put('primary', '', 'p')<Return>
nnoremap <silent> <Plug>(fakeclip-primary-P)
\ :<C-u>call fakeclip#put('primary', '', 'P')<Return>
nnoremap <silent> <Plug>(fakeclip-primary-gp)
\ :<C-u>call fakeclip#put('primary', '', 'gp')<Return>
nnoremap <silent> <Plug>(fakeclip-primary-gP)
\ :<C-u>call fakeclip#put('primary', '', 'gP')<Return>
nnoremap <silent> <Plug>(fakeclip-primary-]p)
\ :<C-u>call fakeclip#put('primary', '', ']p')<Return>
nnoremap <silent> <Plug>(fakeclip-primary-]P)
\ :<C-u>call fakeclip#put('primary', '', ']P')<Return>
nnoremap <silent> <Plug>(fakeclip-primary-[p)
\ :<C-u>call fakeclip#put('primary', '', '[p')<Return>
nnoremap <silent> <Plug>(fakeclip-primary-[P)
\ :<C-u>call fakeclip#put('primary', '', '[P')<Return>
vnoremap <silent> <Plug>(fakeclip-primary-p)
\ :<C-u>call fakeclip#put('primary', visualmode(), 'p')<Return>
vnoremap <silent> <Plug>(fakeclip-primary-P)
\ :<C-u>call fakeclip#put('primary', visualmode(), 'P')<Return>
vnoremap <silent> <Plug>(fakeclip-primary-gp)
\ :<C-u>call fakeclip#put('primary', visualmode(), 'gp')<Return>
vnoremap <silent> <Plug>(fakeclip-primary-gP)
\ :<C-u>call fakeclip#put('primary', visualmode(), 'gP')<Return>
vnoremap <silent> <Plug>(fakeclip-primary-]p)
\ :<C-u>call fakeclip#put('primary', visualmode(), ']p')<Return>
vnoremap <silent> <Plug>(fakeclip-primary-]P)
\ :<C-u>call fakeclip#put('primary', visualmode(), ']P')<Return>
vnoremap <silent> <Plug>(fakeclip-primary-[p)
\ :<C-u>call fakeclip#put('primary', visualmode(), '[p')<Return>
vnoremap <silent> <Plug>(fakeclip-primary-[P)
\ :<C-u>call fakeclip#put('primary', visualmode(), '[P')<Return>

noremap! <Plug>(fakeclip-primary-insert)
\ <C-r>=fakeclip#content('primary')<Return>
noremap! <Plug>(fakeclip-primary-insert-r)
\ <C-r><C-r>=fakeclip#content('primary')<Return>
noremap! <Plug>(fakeclip-primary-insert-o)
\ <C-r><C-o>=fakeclip#content('primary')<Return>
inoremap <Plug>(fakeclip-primary-insert-p)
\ <C-r><C-p>=fakeclip#content('primary')<Return>

nnoremap <silent> <Plug>(fakeclip-primary-d)
\ :<C-u>set operatorfunc=fakeclip#primary_delete<Return>g@
vnoremap <silent> <Plug>(fakeclip-primary-d)
\ :<C-u>call fakeclip#delete('primary', visualmode())<Return>
nnoremap <silent> <Plug>(fakeclip-primary-dd)
\ :<C-u>set operatorfunc=fakeclip#primary_delete<Return>g@g@
nnoremap <silent> <Plug>(fakeclip-primary-D)
\ :<C-u>set operatorfunc=fakeclip#primary_delete<Return>g@$
vnoremap <silent> <Plug>(fakeclip-primary-D)
\ :<C-u>call fakeclip#delete('primary', 'V')<Return>
endif
" end XXX


nnoremap <silent> <Plug>(fakeclip-screen-y)
\ :<C-u>set operatorfunc=fakeclip#pastebuffer_yank<Return>g@
vnoremap <silent> <Plug>(fakeclip-screen-y)
\ :<C-u>call fakeclip#yank('pastebuffer', visualmode())<Return>
nnoremap <silent> <Plug>(fakeclip-screen-Y)
\ :<C-u>call fakeclip#yank_Y('pastebuffer')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-Y)
\ :<C-u>call fakeclip#yank('pastebuffer', 'V')<Return>

nnoremap <silent> <Plug>(fakeclip-screen-p)
\ :<C-u>call fakeclip#put('pastebuffer', '', 'p')<Return>
nnoremap <silent> <Plug>(fakeclip-screen-P)
\ :<C-u>call fakeclip#put('pastebuffer', '', 'P')<Return>
nnoremap <silent> <Plug>(fakeclip-screen-gp)
\ :<C-u>call fakeclip#put('pastebuffer', '', 'gp')<Return>
nnoremap <silent> <Plug>(fakeclip-screen-gP)
\ :<C-u>call fakeclip#put('pastebuffer', '', 'gP')<Return>
nnoremap <silent> <Plug>(fakeclip-screen-]p)
\ :<C-u>call fakeclip#put('pastebuffer', '', ']p')<Return>
nnoremap <silent> <Plug>(fakeclip-screen-]P)
\ :<C-u>call fakeclip#put('pastebuffer', '', ']P')<Return>
nnoremap <silent> <Plug>(fakeclip-screen-[p)
\ :<C-u>call fakeclip#put('pastebuffer', '', '[p')<Return>
nnoremap <silent> <Plug>(fakeclip-screen-[P)
\ :<C-u>call fakeclip#put('pastebuffer', '', '[P')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-p)
\ :<C-u>call fakeclip#put('pastebuffer', visualmode(), 'p')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-P)
\ :<C-u>call fakeclip#put('pastebuffer', visualmode(), 'P')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-gp)
\ :<C-u>call fakeclip#put('pastebuffer', visualmode(), 'gp')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-gP)
\ :<C-u>call fakeclip#put('pastebuffer', visualmode(), 'gP')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-]p)
\ :<C-u>call fakeclip#put('pastebuffer', visualmode(), ']p')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-]P)
\ :<C-u>call fakeclip#put('pastebuffer', visualmode(), ']P')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-[p)
\ :<C-u>call fakeclip#put('pastebuffer', visualmode(), '[p')<Return>
vnoremap <silent> <Plug>(fakeclip-screen-[P)
\ :<C-u>call fakeclip#put('pastebuffer', visualmode(), '[P')<Return>

noremap! <Plug>(fakeclip-screen-insert)
\ <C-r>=fakeclip#content('pastebuffer')<Return>
noremap! <Plug>(fakeclip-screen-insert-r)
\ <C-r><C-r>=fakeclip#content('pastebuffer')<Return>
noremap! <Plug>(fakeclip-screen-insert-o)
\ <C-r><C-o>=fakeclip#content('pastebuffer')<Return>
inoremap <Plug>(fakeclip-screen-insert-p)
\ <C-r><C-p>=fakeclip#content('pastebuffer')<Return>

nnoremap <silent> <Plug>(fakeclip-screen-d)
\ :<C-u>set operatorfunc=fakeclip#pastebuffer_delete<Return>g@
vnoremap <silent> <Plug>(fakeclip-screen-d)
\ :<C-u>call fakeclip#delete('pastebuffer', visualmode())<Return>
nnoremap <silent> <Plug>(fakeclip-screen-dd)
\ :<C-u>set operatorfunc=fakeclip#pastebuffer_delete<Return>g@g@
nnoremap <silent> <Plug>(fakeclip-screen-D)
\ :<C-u>set operatorfunc=fakeclip#pastebuffer_delete<Return>g@$
vnoremap <silent> <Plug>(fakeclip-screen-D)
\ :<C-u>call fakeclip#delete('pastebuffer', 'V')<Return>




" Default key mappings  "{{{2

command! -bang -bar -nargs=0 FakeclipDefaultKeyMappings
\ call s:cmd_FakeclipDefaultKeyMappings(<bang>0)

function! s:cmd_FakeclipDefaultKeyMappings(banged_p)
  let modifier = a:banged_p ? '' : '<unique>'
  " Paste buffer
  let l:t = {'&': '-screen'}
  " Clipboard
  if !has('clipboard') || get(g:, 'fakeclip_provide_clipboard_key_mappings', 0)
    let l:t['*'] = ''
    let l:t['+'] = ''
    if fakeclip#should_distinguish_primary_and_clipboard()
	let l:t['*'] = '-primary'
    endif
  endif
  for [l:k, l:v] in items(l:t)
    execute 'silent! nmap '.modifier.' "'.l:k.'y  <Plug>(fakeclip'.l:v.'-y)'
    execute 'silent! nmap '.modifier.' "'.l:k.'Y  <Plug>(fakeclip'.l:v.'-Y)'
    execute 'silent! nmap '.modifier.' "'.l:k.'yy  <Plug>(fakeclip'.l:v.'-Y)'
    execute 'silent! vmap '.modifier.' "'.l:k.'y  <Plug>(fakeclip'.l:v.'-y)'
    execute 'silent! vmap '.modifier.' "'.l:k.'Y  <Plug>(fakeclip'.l:v.'-Y)'

    execute 'silent! nmap '.modifier.' "'.l:k.'p  <Plug>(fakeclip'.l:v.'-p)'
    execute 'silent! nmap '.modifier.' "'.l:k.'P  <Plug>(fakeclip'.l:v.'-P)'
    execute 'silent! nmap '.modifier.' "'.l:k.'gp  <Plug>(fakeclip'.l:v.'-gp)'
    execute 'silent! nmap '.modifier.' "'.l:k.'gP  <Plug>(fakeclip'.l:v.'-gP)'
    execute 'silent! nmap '.modifier.' "'.l:k.']p  <Plug>(fakeclip'.l:v.'-]p)'
    execute 'silent! nmap '.modifier.' "'.l:k.']P  <Plug>(fakeclip'.l:v.'-]P)'
    execute 'silent! nmap '.modifier.' "'.l:k.'[p  <Plug>(fakeclip'.l:v.'-[p)'
    execute 'silent! nmap '.modifier.' "'.l:k.'[P  <Plug>(fakeclip'.l:v.'-[P)'
    execute 'silent! vmap '.modifier.' "'.l:k.'p  <Plug>(fakeclip'.l:v.'-p)'
    execute 'silent! vmap '.modifier.' "'.l:k.'P  <Plug>(fakeclip'.l:v.'-P)'
    execute 'silent! vmap '.modifier.' "'.l:k.'gp  <Plug>(fakeclip'.l:v.'-gp)'
    execute 'silent! vmap '.modifier.' "'.l:k.'gP  <Plug>(fakeclip'.l:v.'-gP)'
    execute 'silent! vmap '.modifier.' "'.l:k.']p  <Plug>(fakeclip'.l:v.'-]p)'
    execute 'silent! vmap '.modifier.' "'.l:k.']P  <Plug>(fakeclip'.l:v.'-]P)'
    execute 'silent! vmap '.modifier.' "'.l:k.'[p  <Plug>(fakeclip'.l:v.'-[p)'
    execute 'silent! vmap '.modifier.' "'.l:k.'[P  <Plug>(fakeclip'.l:v.'-[P)'

    execute 'silent! map! '.modifier.' <C-r>'.l:k.'  <Plug>(fakeclip'.l:v.'-insert)'
    execute 'silent! map! '.modifier.' <C-r><C-r>'.l:k.'  <Plug>(fakeclip'.l:v.'-insert-r)'
    execute 'silent! map! '.modifier.' <C-r><C-o>'.l:k.'  <Plug>(fakeclip'.l:v.'-insert-o)'
    execute 'silent! imap '.modifier.' <C-r><C-p>'.l:k.'  <Plug>(fakeclip'.l:v.'-insert-p)'

    execute 'silent! nmap '.modifier.' "'.l:k.'d  <Plug>(fakeclip'.l:v.'-d)'
    execute 'silent! vmap '.modifier.' "'.l:k.'d  <Plug>(fakeclip'.l:v.'-d)'
    execute 'silent! nmap '.modifier.' "'.l:k.'dd  <Plug>(fakeclip'.l:v.'-dd)'
    execute 'silent! nmap '.modifier.' "'.l:k.'D  <Plug>(fakeclip'.l:v.'-D)'
    execute 'silent! vmap '.modifier.' "'.l:k.'D  <Plug>(fakeclip'.l:v.'-D)'
  endfor
endfunction

if !exists('g:fakeclip_no_default_key_mappings')
  FakeclipDefaultKeyMappings
endif








" Epilogue  "{{{1

let g:loaded_fakeclip = 1








" __END__  "{{{1
" vim: foldmethod=marker foldlevel=0
