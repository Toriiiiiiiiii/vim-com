if exists('g:loaded_vimcom')
	finish
endif

let g:loaded_vimcom = 1


function! SetCompileCommand(cmd)
	if !isdirectory('.cache')
		call mkdir('.cache')
	endif

	let g:compile_cmd = a:cmd
	call writefile([g:compile_cmd], '.cache/vim-com.cache')
endfunction

function! Compile()
	let res = system(g:compile_cmd)
	echo res
endfunction

if filereadable('.cache/vim-com.cache')
	let g:compile_cmd = readfile('.cache/vim-com.cache')[0]
else
	let g:compile_cmd = 'echo "Error: Compile command not set!"'
endif

command! -nargs=1 SetCom call SetCompileCommand(<q-args>)
command! -nargs=0 Com call Compile()
