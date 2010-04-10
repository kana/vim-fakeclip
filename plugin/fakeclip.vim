" fakeclip - pseude clipboard register for non-GUI version of Vim
" Version: @@VERSION@@
" Copyright (C) 2007-2010 kana <http://whileimautomaton.net/>
" License: So-called MIT/X license  {{{
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




" Default key mappings  "{{{2

command! -bang -bar -nargs=0 FakeclipDefaultKeyMappings
\ call s:cmd_FakeclipDefaultKeyMappings(<bang>0)

function! s:cmd_FakeclipDefaultKeyMappings(banged_p)
  let modifier = a:banged_p ? '' : '<unique>'
  " Clipboard
  if !has('clipboard')
    for _ in ['+', '*']
      execute 'nmap '.modifier.' "'._.'y  <Plug>(fakeclip-y)'
      execute 'nmap '.modifier.' "'._.'Y  <Plug>(fakeclip-Y)'
      execute 'nmap '.modifier.' "'._.'yy  <Plug>(fakeclip-Y)'
      execute 'vmap '.modifier.' "'._.'y  <Plug>(fakeclip-y)'
      execute 'vmap '.modifier.' "'._.'Y  <Plug>(fakeclip-Y)'

      execute 'nmap '.modifier.' "'._.'p  <Plug>(fakeclip-p)'
      execute 'nmap '.modifier.' "'._.'P  <Plug>(fakeclip-P)'
      execute 'nmap '.modifier.' "'._.'gp  <Plug>(fakeclip-gp)'
      execute 'nmap '.modifier.' "'._.'gP  <Plug>(fakeclip-gP)'
      execute 'nmap '.modifier.' "'._.']p  <Plug>(fakeclip-]p)'
      execute 'nmap '.modifier.' "'._.']P  <Plug>(fakeclip-]P)'
      execute 'nmap '.modifier.' "'._.'[p  <Plug>(fakeclip-[p)'
      execute 'nmap '.modifier.' "'._.'[P  <Plug>(fakeclip-[P)'
      execute 'vmap '.modifier.' "'._.'p  <Plug>(fakeclip-p)'
      execute 'vmap '.modifier.' "'._.'P  <Plug>(fakeclip-P)'
      execute 'vmap '.modifier.' "'._.'gp  <Plug>(fakeclip-gp)'
      execute 'vmap '.modifier.' "'._.'gP  <Plug>(fakeclip-gP)'
      execute 'vmap '.modifier.' "'._.']p  <Plug>(fakeclip-]p)'
      execute 'vmap '.modifier.' "'._.']P  <Plug>(fakeclip-]P)'
      execute 'vmap '.modifier.' "'._.'[p  <Plug>(fakeclip-[p)'
      execute 'vmap '.modifier.' "'._.'[P  <Plug>(fakeclip-[P)'

      execute 'map! '.modifier.' <C-r>'._.'  <Plug>(fakeclip-insert)'
      execute 'map! '.modifier.' <C-r><C-r>'._.'  <Plug>(fakeclip-insert-r)'
      execute 'map! '.modifier.' <C-r><C-o>'._.'  <Plug>(fakeclip-insert-o)'
      execute 'imap '.modifier.' <C-r><C-p>'._.'  <Plug>(fakeclip-insert-p)'
    endfor
  endif

  " Paste buffer
  execute 'nmap '.modifier.' "&y  <Plug>(fakeclip-screen-y)'
  execute 'nmap '.modifier.' "&Y  <Plug>(fakeclip-screen-Y)'
  execute 'nmap '.modifier.' "&yy  <Plug>(fakeclip-screen-Y)'
  execute 'vmap '.modifier.' "&y  <Plug>(fakeclip-screen-y)'
  execute 'vmap '.modifier.' "&Y  <Plug>(fakeclip-screen-Y)'

  execute 'nmap '.modifier.' "&p  <Plug>(fakeclip-screen-p)'
  execute 'nmap '.modifier.' "&P  <Plug>(fakeclip-screen-P)'
  execute 'nmap '.modifier.' "&gp  <Plug>(fakeclip-screen-gp)'
  execute 'nmap '.modifier.' "&gP  <Plug>(fakeclip-screen-gP)'
  execute 'nmap '.modifier.' "&]p  <Plug>(fakeclip-screen-]p)'
  execute 'nmap '.modifier.' "&]P  <Plug>(fakeclip-screen-]P)'
  execute 'nmap '.modifier.' "&[p  <Plug>(fakeclip-screen-[p)'
  execute 'nmap '.modifier.' "&[P  <Plug>(fakeclip-screen-[P)'
  execute 'vmap '.modifier.' "&p  <Plug>(fakeclip-screen-p)'
  execute 'vmap '.modifier.' "&P  <Plug>(fakeclip-screen-P)'
  execute 'vmap '.modifier.' "&gp  <Plug>(fakeclip-screen-gp)'
  execute 'vmap '.modifier.' "&gP  <Plug>(fakeclip-screen-gP)'
  execute 'vmap '.modifier.' "&]p  <Plug>(fakeclip-screen-]p)'
  execute 'vmap '.modifier.' "&]P  <Plug>(fakeclip-screen-]P)'
  execute 'vmap '.modifier.' "&[p  <Plug>(fakeclip-screen-[p)'
  execute 'vmap '.modifier.' "&[P  <Plug>(fakeclip-screen-[P)'

  execute 'map! '.modifier.' <C-r>&  <Plug>(fakeclip-screen-insert)'
  execute 'map! '.modifier.' <C-r><C-r>&  <Plug>(fakeclip-screen-insert-r)'
  execute 'map! '.modifier.' <C-r><C-o>&  <Plug>(fakeclip-screen-insert-o)'
  execute 'imap '.modifier.' <C-r><C-p>&  <Plug>(fakeclip-screen-insert-p)'
endfunction

if !exists('g:fakeclip_no_default_key_mappings')
  FakeclipDefaultKeyMappings
endif








" Epilogue  "{{{1

let g:loaded_fakeclip = 1








" __END__  "{{{1
" vim: foldmethod=marker foldlevel=0
