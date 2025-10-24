"let g:loaded_netrw = 1
"let g:loaded_netrwPlugin = 1

let g:tagbar_type_att_asm = {
	\ 'kinds' : [
		\ 'l:label',
	\ ],
\ }
" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="jk"
let g:UltiSnipsJumpBackwardsTrigger="<S-Tab>"
set termguicolors

" == MAIN SETTINGS ============================================================
set nocompatible				" no need for legacy vi
"set ttyfast						" always assume a fast TTY
set nobackup					" don't use backups
set noswapfile					" don't use swapfiles
set modelines=3					" first 3 lines are parsed for modelines
set history=1000				" set history lines
set undolevels=1000				" set undo levels
set path=./**,,					" recursively include CWD  to path (to use :find)
set backspace=indent,eol,start	" allow backspacing over everything
set autowrite					" auto-save before 'make'
set virtualedit=onemore			" we may set cursor to EOL+1
set hidden						" allow changing buffer without saving
set wildmenu					" enhanced command-line completion mode
set wildmode=list:longest		" wildmenu style
set number						" always how real number of current line
set clipboard+=unnamedplus		" always use clipboard
set ssop=blank,buffers,folds,help,options,resize,sesdir,tabpages,unix,winpos,winsize


" == BASIC VISUALS ===========================================================
set title					" change terminal's title
set visualbell				" don't beep
set noerrorbells			" suppress annoying bell on error


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
set wrap					" wrap text by default

" show invisible characters
set list
set listchars=tab:»·
set listchars+=trail:·
set listchars+=extends:>
set listchars+=precedes:<
set listchars+=eol:◃

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
"==============================================================================
" set <leader> to ','
let mapleader = ","

"  : clear highlighted things
nnoremap <leader><space> :noh<cr>

" ft: fold tag
nnoremap <leader>ft Vatzf

" q: hard-wrap current paragraph
vnoremap <leader>q gqip

" ev: split-open vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" v: vertical map with new buffer
nnoremap <leader>v :vnew<cr>

" s: horizontal map with new buffer
nnoremap <leader>s :new<cr>

" tr: toggle filesystem tree
nnoremap <leader>tr :NvimTreeToggle<cr>

" tag: toggle programming tagbar
nnoremap <leader>tag :TagbarToggle<cr>

" hex: enable hex view
nnoremap <leader>hex :%!xxd<cr>

" unhex: disable hex view
nnoremap <leader>unhex :%!xxd -r<cr>


nnoremap ' `|								" goto mark with lin+col w/o backtick

tnoremap <Esc> <C-\><C-n>
inoremap <F1> <ESC>|						" get rid of F1-help in all modes
nnoremap <F1> <ESC>|
vnoremap <F1> <ESC>|

nnoremap / /\v|								" Fix vim's crazy regexes
vnoremap / /\v|								" -||-

"==== CUSTOM PLUG-IN VARIABLE =================================================
let g:tlTokenList = ['TODO', 'ToDo', 'fixme', 'FIXME', 'BORKEN', 'XXX', 'BROKEN']
	" ^ Highlighting Token list
