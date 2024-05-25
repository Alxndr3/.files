" set nocompatible              " be iMproved, required
" filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" " alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/.vim/plugins')
" " let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plugin 'ryanoasis/vim-devicons'
" Plugin 'tmhedberg/SimpylFold'
" Plugin 'preservim/nerdtree'
" Plugin 'ycm-core/YouCompleteMe'
" Plugin 'dense-analysis/ale' 
" Plugin 'Yggdroot/indentLine'
" Plugin 'nvie/vim-flake8'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'mattn/emmet-vim' 
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

" call vundle#end() " required

filetype plugin indent on " required

filetype plugin on " required for vimwiki

" set guifont=Montserrat\ Medium
" set guifont=JetBrainsMono\ Nerd\ Font:12.5
" set guifont=Hack\ Nerd\ Font:12.5

set ambiwidth=double " Solve vim-devicons cut half
set bg=dark
set clipboard=unnamedplus
set cursorline
set encoding=UTF-8
set iskeyword+=-
set foldlevel=99
set foldmethod=indent " Enabling folding
set wildmenu
set hlsearch " hilights words when searched
set visualbell
set ignorecase
set nuw=6
set backspace=indent,eol,start
set mouse=a
" set omnifunc=syntaxcomplete#Complete
set relativenumber
set smartcase
set statusline+=%#warningmsg#"
set shell=zsh 
set splitbelow splitright
set showcmd
set showmatch

syntax on

colorscheme gruvbox

" Toggle vim transparent mode
let t:is_transparent = 0                                                            
function! ToggleTransparentBackground()                                                       
	if t:is_transparent == 0                                                                      
		hi Normal guibg=NONE ctermbg=NONE
		let t:is_transparent = 1                                                                    
	else                                                                                          
		"hi Normal guibg=#111111 ctermbg=black                                                       
		hi Normal guibg=#282828 ctermbg=black                                                       
		let t:is_transparent = 0                                                                    
		colorscheme gruvbox
	endif                                                                                         
endfunction                                                                                     
nnoremap <C-x>x :call ToggleTransparentBackground()<CR>

let python_highlight_all = 1

autocmd Filetype yaml set cursorcolumn
autocmd Filetype yml set cursorcolumn
autocmd Filetype python set cursorcolumn

" PEP 8 identation
au BufNewFile,BufRead *.py
			\ set encoding=UTF-8 |
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=120 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix |
			\ filetype plugin indent on

au BufNewFile,BufRead *.cpp,*.sh,*.conf,*.json
			\ set encoding=UTF-8 |
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=120 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix

au BufNewFile,BufRead *.md
			\ set encoding=UTF-8 |
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix

au BufNewFile,BufRead *.tf,*.yml,*.yaml
			\ set encoding=UTF-8 |
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2 |
			\ set textwidth=120 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix

au BufNewFile,BufRead *.html,*.css,*.js
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1 " To see the docstrings for folded code

map <Enter> o<ESC>k
map <C-Enter> O<ESC>j

" Save file
inoremap <C-s> <ESC>:update<CR>
nnoremap <C-s> :update<CR>
" noremap <C-s> :update<CR>
" vnoremap <C-S> <C-C>:update<CR>

" Run current python script.
map <C-c>p <Esc>:!clear<CR>:w<CR>:!python3 %<CR>
imap <C-c>p <Esc>:!clear<CR>:w<CR>:!python3 %<CR>

" Run current shell script.
map <C-c>s <Esc>:!clear<CR>:w<CR>:!bash %<CR>
imap <C-c>s <Esc>:!clear<CR>:w<CR>:!bash %<CR>

nnoremap <C-\>r <Esc>:w<CR><Esc>:terminal python3 %<CR><Esc>:resize -7<CR><Esc>:<Esc>
"map <C-\>p <Esc>:w<CR><Esc>:terminal python3 %<CR><Esc>:resize -7<CR><Esc>:<Esc>
"imap <C-\>p <Esc>:w<CR><Esc>:terminal python3 %<CR><Esc>:resize -7<CR><Esc>:<Esc>

" Shortcutting split navigation.
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-c>c <C-c>:

" CtrlP
map <C-k>p :CtrlP<CR>
let g:ctrlp_custom_ignore = ' v[ /] .(swp|zip|tar.gz)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_show_hidden = 1

" Open terminal
map <C-t>t  :terminal<CR><C-w>:resize -7<CR>. ./venv/bin/activate & clear<CR>

" identline
let g:indentLine_enabled = 1
map <C-c>i :IndentLinesToggle<CR>
let g:indentLine_char = '¦'

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Make NERDTree open by default.
" autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Close NERDTree when closing main split screen.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Default python version for vim
let g:syntastic_python_python_exec = '/home/alexandre/.pyenv/shims/python3.11'
let g:syntastic_python_pylint_post_args="--max-line-length=120"

" vim-airline
let g:airline_theme='base16_gruvbox_dark_hard'

let g:airline#extensions#tabline#buffer_idx_mode = 1 " Move between buffers

nmap <C-Space>1 <Plug>AirlineSelectTab1
nmap <C-Space>2 <Plug>AirlineSelectTab2
nmap <C-Space>3 <Plug>AirlineSelectTab3
nmap <C-Space>4 <Plug>AirlineSelectTab4
nmap <C-Space>5 <Plug>AirlineSelectTab5
nmap <C-Space>6 <Plug>AirlineSelectTab6
nmap <C-Space>7 <Plug>AirlineSelectTab7
nmap <C-Space>8 <Plug>AirlineSelectTab8
nmap <C-Space>9 <Plug>AirlineSelectTab9
nmap <C-Space>0 <Plug>AirlineSelectTab0
nmap <C-Space>h <Plug>AirlineSelectPrevTab
nmap <C-Space>l <Plug>AirlineSelectNextTab

" Close buffer
noremap <C-x> :bp \| bd #<CR>

" Toggle airline
map <C-Space>a :AirlineToggle<CR>

"" Enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline enalbe color
" set t_Co=256

" airline unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" airline enable mouse clicks
let g:airline#extensions#tabline#mouse_enabled = 1
let g:airline#extensions#bufferline#mouse_enabled = 1

set noshowmode

let g:ale_linters = {'python': ['flake8']}
let g:ale_completion_enabled = 0

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = '/home/alexandre/.pyenv/shims/python3.11'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_max_diagnostics_length = 120

" Closing Braces
" inoremap (( ()<left>
" inoremap [[ []<left>
" inoremap {{ {}<left>
" inoremap '' ''<left>
" inoremap "" ""<left>

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_listsyms = '✗○◐●✓'

" vim-termiator
let g:terminator_split_fraction = 0.3
map <C-c>rf :TerminatorRunFileInOutputBuffer<CR>
map <leader>rc :TerminatorOutputBufferClose<CR>

" Remove '~' from vim
" highlight EndOfBuffer ctermfg=bg
" highlight EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
let &fcs='eob: '
