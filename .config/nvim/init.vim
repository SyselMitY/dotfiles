call plug#begin(stdpath("data") . "/plugged")

	Plug 'SirVer/ultisnips'
	Plug 'lervag/vimtex'

	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " NerdTree (,tr)
	Plug 'luochen1990/rainbow'				" Rainbow parantheses
	Plug 'bling/vim-airline'				" airline
	Plug 'vim-airline/vim-airline-themes'	" themes for airline
	Plug 'majutsushi/tagbar'				" Programming tagbar (,tag)
	Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
	Plug 'dag/vim-fish'
call plug#end()


let g:tagbar_type_att_asm = {
	\ 'kinds' : [
		\ 'l:label',
	\ ],
\ }

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="jk"
let g:UltiSnipsJumpBackwardsTrigger="<S-Tab>"


" == MAIN SETTINGS ============================================================
syntax on
filetype plugin on	" auto-detect file types
filetype indent off    " auto-detect file types
"filetype plugin indent off " auto-detect file types
set t_Co=256				" display nicer colors in textmode, use 88 or 256
set nocompatible			" no need for legacy vi
set ttyfast					" always assume a fast TTY
set nobackup				" don't use backups
set noswapfile				" don't use swapfiles
set modelines=3				" first 3 lines are parsed for modelines
set history=1000			" set history lines
set undolevels=1000			" set undo levels
set path=./**,,				" recursively include CWD  to path (to use :find)
set backspace=indent,eol,start "allow backspacing over everything
set autowrite				" auto-save before 'make'
set virtualedit=onemore		" we may set cursor to EOL+1
set ssop=blank,buffers,folds,help,options,resize,sesdir,tabpages,unix,winpos,winsize
set hidden					" unsure?
set wildmenu				" enhanced command-line completion mode
set wildmode=list:longest	" wildmenu style
set number					" always how real number of current line
set relativenumber			" use relative line numbering for other lines
set clipboard+=unnamedplus	" always use clipboard


" == BASIC VISUALS ===========================================================
set title					" change terminal's title
set visualbell				" don't beep
set noerrorbells			" suppress annoying bell on error
set cursorline				" Highlight current line
set colorcolumn=80			" column 80 is colored


" == WHITESPACE ===============================================================
set tabstop=4				" 1 tab = 4 spaces
set shiftwidth=4			" 1 shift l/r = 4 spaces
set shiftround				" round indent to multiples of shiftwidth
set softtabstop=4			" ?
set smarttab				" tab-insert on line start as shiftwidht, not tabstop
set smartindent				" automatically do indentation
set copyindent				" autoindented lines are exactly like lines before
set indentexpr=				" get rid of damn left-shifting of tex lines
set nojoinspaces			" Don't put 2 spaces after [.!?] when joining lines
set lbr						" Word wrap visually
set wrapscan				" search wrap around EOF
set wrap					"  wrap text by default

" show invisible characters
set list
set listchars=tab:»·
set listchars+=trail:·
set listchars+=extends:>
set listchars+=precedes:<
set listchars+=eol:◃


" == ENCODINGS ================================================================
set termencoding=utf-8		" UTF-8 only
set fileencodings=ucs-bom,utf-8,latin1 " encoding priority
set fileformats=unix,dos	" line-end format, order of priority

" == MOUSE/SCROLLING ==========================================================
set mouse=a					" allow mouse in textmode
set mousehide				" hide mousepointer during typing
set scrolloff=3				" 3 lines offset for scrolling
set sidescroll=1			" side-scroll character-wise
set sidescrolloff=3			" minimal columns to keep to the left/right of the cursor


"==== FOLDING =================================================================
set nofoldenable			" disable folding per default
set foldmethod=manual		" fold manually, not by indent
set foldnestmax=1			" only fold first indent level (if foldmethod=indent)


"== SEARCHING & CASEING =======================================================
set ignorecase				" ignore search casing
set smartcase				" ...except if I type uppercase letters
set gdefault				" on regexes, assume ///g by default
set incsearch				" jump to first match(es) while typing
set showmatch				" very quickly jump to matching bracket
set matchtime=3				" show match for 0.3 seconds
set hlsearch				" higlight search results
set showfulltag				" tag/pattern is shown during autocompletion
set infercase				" adjust case when keyword completion is used
set textwidth=80			" regular textwidth 
set formatoptions=qrnl1
	" q = allow comment formatting with "gq"
	" r = auto-insert comment leader after <Enter>
	" n = recognize numbered lists
	" l = do not auto-break lines longer than textwidth
	" 1 = don't break line after 1-letter word



"== MAPLEADER & MAPPINGS ======================================================
" Set the <leader> and define all shortcuts
"  Note: Ending the map command with a pipe (|) and *no* space inbetween,
"		allows us to add an inline comment in the same line without running
"		into any troubles with the command itself.
"		See https://stackoverflow.com/questions/24716804 for details
"==============================================================================
let mapleader = ","						" set <leader> to ','
nnoremap <leader><space> :noh<cr>|		"  ', ' = no-highlight
"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>	" strip whitespaces in file
nnoremap <leader>W :w !sudo tee % >/dev/null
nnoremap <leader>a :Ack
nnoremap <leader>R :so $MYVIMRC<CR>|	" reload vimrc (nvim: init.vim)
nnoremap <leader>ft Vatzf|				" ft: fold tag
vnoremap <leader>q gqip|				" q: hard-wrap current paragraph
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>| "^ split-open vimrc
"nnoremap <leader>s <C-w>v<C-w>l		" s: vertical split with new content
nnoremap <leader>v :vnew<cr>|			" vertical map with new buffer
nnoremap <leader>s :new<cr>|			" horizontal map with new buffer
nnoremap <leader>nt :tabnew<cr>|		" t: open and goto new tab
nnoremap <leader>tr :NERDTreeToggle<cr>| " toggle filesystem tree
nnoremap <leader>tag :TagbarToggle<cr>| " Toggle programming tagbar
nnoremap <leader>p "+p|					" paste x11 clipboard
nnoremap <leader>y "*y|					" copy to x11 clipboard
nnoremap <leader>spe :setlocal spell! spelllang=en<cr>| " enable EN spelling
nnoremap <leader>spg :setlocal spell! spelllang=de<cr>| " enable DE spelling
nnoremap <leader>sne ]s|				" jump to next misspelled word
nnoremap <leader>spr [s|				" jump to previous misspelled word

nnoremap <leader>add zg|				" add word under cursor to dictionary
nnoremap <leader>hex :%!xxd<cr>|		" enable hex view
nnoremap <leader>unhex :%!xxd -r<cr>|	" disable hex view
nnoremap ' `|							" goto mark with lin+col w/o backtick

tnoremap <Esc> <C-\><C-n>
inoremap <F1> <ESC>|					" get rid of F1-help in all modes
nnoremap <F1> <ESC>|
vnoremap <F1> <ESC>|

nnoremap / /\v|							" Fix vim's crazy regexes
vnoremap / /\v|							" -||-
set pastetoggle=<F2>

" Change tabs
nmap <C-h> :tabprevious<cr>|
nmap <C-l> :tabnext<cr>|
imap <C-h> <C-o>:tabprevious<cr>|
imap <C-l> <C-o>:tabnext<cr>|

"= Hack: Make sure terminals with <256 colors are still readable
if &t_Co <= 0
	if &term =~ "xterm"
		if has("terminfo")
			set t_Co=8
			set t_Sf=^[[3%p1%dm
			set t_Sb=^[[4%p1%dm
		else
			set t_Co=8
			set t_Sf=^[[3%dm
			set t_Sb=^[[4%dm
		endif
	endif
endif



"==== CUSTOM PLUG-IN VARIABLE =================================================
let g:tlTokenList = ['TODO', 'ToDo', 'fixme', 'FIXME', 'BORKEN', 'XXX', 'BROKEN']
	" ^ Highlighting Token list


" === AUTOCMDs ================================================================
autocmd filetype html,xml set listchars-=tab:>.		" no <> on XML and friends
" au FocusLost * :wa		" save contents on loosing focus


"==== STATUSLINE & AIRLINE CONFIG =============================================
set ruler					" always show line+column number
set noshowmode				" mode is shown by airline, so don't show twice
set laststatus=2			" always show status line
set showcmd					" always show current command


let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

"" unicode symbols
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = ''
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.paste = 'π'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.linenr = ''

" Use short form of modes
let g:airline_mode_map = {
	\ '__' : '-',
	\ 'n'  : 'N',
	\ 'i'  : 'I',
	\ 'R'  : 'R',
	\ 'c'  : 'C',
	\ 'v'  : 'V',
	\ 'V'  : 'V',
	\ '' : 'V',
	\ 's'  : 'S',
	\ 'S'  : 'S',
	\ '' : 'S',
	\ }

function! AirlineInit()
	" show hex+dec ASCII code of current character
	let g:airline_section_y = airline#section#create(['ffenc',' [0x%B|%b]'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" don't check for whitespaces
let g:airline#extensions#whitespace#enabled = 0


" == DIRECT DOCUMENT SHORTCUTS ================================================
command! Cheat :tabnew ~/.config/nvim/cheatsheet


" == COLORS & STYLE ===========================================================
" ***NOTE: they have no effect here - must be placed below colorscheme to work!
" set colors for special characters and overlengthy lines
highlight SpecialKey ctermfg=DarkBlue
highlight NonText ctermfg=DarkRed
highlight OverLength ctermbg=darkred guibg=#592929


" == FINAL STATEMENT: LOAD COLORSCHEMES, etc ==================================
let g:airline_theme = 'violet'
set background=dark			" make comments more readable

colorscheme "catppuccin-macchiato"


highlight SpellBad ctermbg=DarkRed guibg=DarkRed
