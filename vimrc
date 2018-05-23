colorscheme cobalt
set mouse=a

set relativenumber
set number

set ts=4 sw=4

set cursorcolumn
set cursorline

set list
set listchars=tab:\|\ 

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'w0rp/ale'

Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'sickill/vim-pasta'

"Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

map <silent> <C-n> :NERDTreeToggle<CR>
