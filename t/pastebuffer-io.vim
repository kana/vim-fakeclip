runtime! plugin/fakeclip.vim
call vspec#hint({
\   'scope': 'fakeclip#_local_variables()',
\   'sid': 'fakeclip#_sid_prefix()',
\ })
let g:fakeclip_delay_to_read_pastebuffer_gnuscreen = 1

let s:testable_tools = []
if executable('screen') && $STY != ''
  call add(s:testable_tools, 'screen')
endif
if executable('tmux') && $TMUX != ''
  call add(s:testable_tools, 'tmux')
endif
command! -nargs=1 Only
\   if index(s:testable_tools, <q-args>)
\ |   SKIP 'not in the terminal multiplexer'
\ | end




" FIXME: Test cases for both tools are mostly same.
describe 'fakeclip'
  context 'in GNU screen'
    it 'can read an empty string'
      Only screen
      call Call('s:write_pastebuffer_gnuscreen', [''])
      Expect Call('s:read_pastebuffer_gnuscreen') ==# ''
      Expect Call('s:read_pastebuffer_gnuscreen') ==# ''
    end

    it 'can read a string without newlines'
      Only screen
      call Call('s:write_pastebuffer_gnuscreen', ['A'])
      Expect Call('s:read_pastebuffer_gnuscreen') ==# 'A'
      Expect Call('s:read_pastebuffer_gnuscreen') ==# 'A'
    end

    it 'can read a single-line string'
      Only screen
      call Call('s:write_pastebuffer_gnuscreen', ['B', ''])
      Expect Call('s:read_pastebuffer_gnuscreen') ==# "B\n"
      Expect Call('s:read_pastebuffer_gnuscreen') ==# "B\n"
    end

    it 'can read a multi-line string'
      Only screen
      call Call('s:write_pastebuffer_gnuscreen', ['C', 'D', ''])
      Expect Call('s:read_pastebuffer_gnuscreen') ==# "C\nD\n"
      Expect Call('s:read_pastebuffer_gnuscreen') ==# "C\nD\n"
    end

    it 'can read a multi-line string witout the last newline'
      Only screen
      call Call('s:write_pastebuffer_gnuscreen', ['E', 'F'])
      Expect Call('s:read_pastebuffer_gnuscreen') ==# "E\nF"
      Expect Call('s:read_pastebuffer_gnuscreen') ==# "E\nF"
    end

    it 'reads the "." register of GNU screen'
      Only screen
      silent !screen -X register . ''
      Expect Call('s:read_pastebuffer_gnuscreen') ==# ''
      Expect Call('s:read_pastebuffer_gnuscreen') ==# ''
    end
  end

  context 'in tmux'
    it 'can read an empty string'
      Only tmux
      call Call('s:write_pastebuffer_tmux', [''])
      Expect Call('s:read_pastebuffer_tmux') ==# ''
      Expect Call('s:read_pastebuffer_tmux') ==# ''
    end

    it 'can read a string without newlines'
      Only tmux
      call Call('s:write_pastebuffer_tmux', ['A'])
      Expect Call('s:read_pastebuffer_tmux') ==# 'A'
      Expect Call('s:read_pastebuffer_tmux') ==# 'A'
    end

    it 'can read a single-line string'
      Only tmux
      call Call('s:write_pastebuffer_tmux', ['B', ''])
      Expect Call('s:read_pastebuffer_tmux') ==# "B\n"
      Expect Call('s:read_pastebuffer_tmux') ==# "B\n"
    end

    it 'can read a multi-line string'
      Only tmux
      call Call('s:write_pastebuffer_tmux', ['C', 'D', ''])
      Expect Call('s:read_pastebuffer_tmux') ==# "C\nD\n"
      Expect Call('s:read_pastebuffer_tmux') ==# "C\nD\n"
    end

    it 'can read a multi-line string witout the last newline'
      Only tmux
      call Call('s:write_pastebuffer_tmux', ['E', 'F'])
      Expect Call('s:read_pastebuffer_tmux') ==# "E\nF"
      Expect Call('s:read_pastebuffer_tmux') ==# "E\nF"
    end
  end
end
