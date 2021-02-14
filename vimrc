if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

colorscheme cobalt "name of colorscheme
hi Normal guibg=NONE ctermbg=NONE "use terminal background settings

set number "display current number line
set relativenumber "display relative number lines
set mouse=a "allow mouse navigation

set hidden "allow buffers
set history=100 "let vim use more memory

set backspace=2 "ensure that backspace works properly
set tabstop=4 "width of tab
set softtabstop=4
set shiftwidth=4
set expandtab "use spaces for tab
set tabstop=4 "width of tab

set hlsearch "highlight found words
set showmatch "display matching parantheses

set cursorline
set cursorcolumn

set list
set listchars=tab:\|\ 

set colorcolumn=80 "display vertical line at column 80
highlight ColorColumn ctermbg=DarkGray

" specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'ap/vim-buftabline'

Plug 'tpope/vim-fugitive'

Plug 'sickill/vim-pasta'

Plug 'w0rp/ale'

Plug 'scrooloose/nerdtree'

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

Plug 'airblade/vim-gitgutter'

" initialize plugin system
call plug#end()

" key to toggle nerd tree
:nnoremap <C-n> :NERDTreeToggle<CR>
