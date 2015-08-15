filetype off


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
"" call pathogen#infect()


execute pathogen#infect()
execute  pathogen#helptags()

filetype plugin indent on
syntax on


" Automatic reloading of .vimrc
 autocmd! bufwritepost .vimrc source %


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

"" set pastetoggle=<F2>
"" set clipboard=unnamed


" Mouse and backspace
 set mouse=a  " on OSX press ALT and click
 set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" Space is the biggest key in the keyboard and can be easily accessed using
" both hands
let mapleader = "\<Space>"


" Disable the keyboard arrow keys for movement.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Toggle highlight search
nmap <silent> <leader>s :set hlsearch!<CR>

" Quicksave command
" As soon I save, I would like vim to go to the normal mode. If you don't need
" that behaviour you can remove the <Esc> from the end of the command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR><Esc>


" Quick quit command
 noremap <Leader>e :quit<CR>  " Quit current window
 noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
 map <c-j> <c-w>j
 map <c-k> <c-w>k
 map <c-l> <c-w>l
 map <c-h> <c-w>h


" easier moving between tabs
 map <Leader>n <esc>:tabprevious<CR>
 map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
"" vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
"" vnoremap < <gv  " better indentation
"" vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/


" Showing line numbers and length
 set number  " show line numbers
"" set tw=79   " width of document (used by gd)
"" set nowrap  " don't automatically wrap on load
"" set fo-=t   " don't automatically wrap text when typing
"" set colorcolumn=80
"" highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
 set tabstop=4
 set softtabstop=4
 set shiftwidth=4
 set shiftround
 set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable backup and swap files - they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
"" set noswapfile


" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
 set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
"" let g:ctrlp_max_height = 30
"" set wildignore+=*.pyc
"" set wildignore+=*_build/*
"" set wildignore+=*/coverage/*

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
 map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
let g:jedi#usages_command = ""
" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
 set nofoldenable

 " Flake8 for code analysis
 " sudo pip install flake8
 " cd `/.vim/bundles
 " git clone --recursive https://github.com/nvie/vim-flake8
autocmd BufWritePost *.py call Flake8()

" Show white spaces in vim 
"" Show extra whitespace
set list
set listchars=tab:->,trail:~,extends:>,precedes:<

if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif

" Solarized color scheme for vim
" $ cd ~/.vim/bundle
" $ git clone git://github.com/altercation/vim-colors-solarized.git

" set term=xterm-256color
if !has('gui_running')
" let g:solarized_termcolors = &t_Co
"    let g:solarized_termtrans = 1
endif
set background=dark
colorscheme solarized

" let &colorcolumn=join(range(81,999),",")
 hi ColorColumn guibg=#0EE642 ctermbg=24
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
" set colorcolumn=80
au BufWinEnter *.py let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
autocmd FileType python setlocal cc=80


" run python by pressin f9
nnoremap <buffer> <F9> :exec '!python3.4' shellescape(@%, 1)<cr>
call togglebg#map("<F5>")

" vim airlinne is a replacement for  vim-powerline.
" For this to work remove the vim-powerline directory from .vim/bundle folder
" and install vim-airline using the following
" $ cd ~/.vim/bundle
" $ git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
" $ cd /.fonts
" $ git clone https://github.com/powerline/fonts.git
" $ cd fonts
" $ ./install.sh
" $ cd
" $ wget
" https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
" $ wget
" https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
" $ mv PowerlineSymbols.otf ~/.fonts/
" $ fc-cache -vf ~/.fonts/
" $ mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
" Sometime you may need to reboot the machine.
"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
