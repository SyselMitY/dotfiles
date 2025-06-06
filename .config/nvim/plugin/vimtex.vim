let g:vimtex_view_method = "zathura"


" Get Vim's window ID for switching focus from Zathura to Vim using xdotool.
" Only set this variable once for the current Vim instance.
if !exists("g:vim_window_id")
	let g:vim_window_id = system("xdotool getactivewindow")
endif

function! s:TexFocusVim() abort
	" Give window manager time to recognize focus moved to Zathura;
	" tweak the 200m (200 ms) as needed for your hardware and window manager.
	sleep 200m  

	" Refocus Vim and redraw the screen
	silent execute "!xdotool windowfocus " . expand(g:vim_window_id)
	redraw!
endfunction

set conceallevel=2 
"augroup vimtex_event_focus
"	au!
"	au User VimtexEventView call s:TexFocusVim()
"augroup END
