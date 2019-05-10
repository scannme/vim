" Begin ~/.vimrc

set nocompatible
syntax on
set showcmd
set ruler
set backspace=2
set tabstop=4
set shiftwidth=4

" set the background color
if (&term == "iterm") || (&term == "putty")
	set background=dark
endif

" set ctags support
"set tags=tags;/
let work_dir=expand("%:p:h")
"set autochdir
"autocmd BufEnter * silent! lcd %:p:h

" set cscope support
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb
	
	" add database in up directory call findup stript
	let csdbfile = glob("`findup.sh . cscope.out`")
	if (csdbfile != "")
		exe "cs add " . csdbfile
		exe "cd " . fnamemodify(csdbfile, ':p:h')
	endif

	" map the cscope command to CTRL + \
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" TList configure
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1

" Set mapleader
let mapleader = "."
let g:mapleader = "."

" map some plugin: Tlist, bufexpore, explore
nmap <silent> <leader>b :BufExplorer<cr>
nmap <silent> <leader>e :Explore<cr>
nmap <silent> <leader>t :TlistToggle<cr>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	\| exe "normal g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
if has("autocmd")
	filetype indent on
endif

" define function to get the include file macro.
function Hfile_macro(fname)
	let	name = join(split(a:fname, '\.'), "_")
	let	upname = toupper(name)
	return	upname
endfunction

" set number line at left and set max number is 4
set number
set numberwidth=4

" set status bar at buttom.
set laststatus=2
set statusline=%F\ [TYPE=%Y]\ [ASCII:HEX=\%03.3b:%02.2B]\ [POS=%04l,%04v][%p%%]\ [LINES=%L]

" End /etc/vimrc

