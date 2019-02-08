colorscheme cobalt
set mouse=a

set relativenumber
set number

set ts=8 sw=8

set cursorcolumn
set cursorline

set hlsearch

set list
set listchars=tab:\|\ 

set colorcolumn=80
highlight ColorColumn ctermbg=DarkGray

set tw=80

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'w0rp/ale'

Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'sickill/vim-pasta'

"Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

map <silent> <C-n> :NERDTreeToggle<CR>
