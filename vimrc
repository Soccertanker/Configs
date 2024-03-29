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

" allow for smart indenting on newline depending on file type
set autoindent
filetype plugin indent on

set list
set listchars=tab:\|\ 

set colorcolumn=80 "display vertical line at column 80
highlight ColorColumn ctermbg=DarkGray

" click shift tab to toggle between tabs and spaces for indent
nnoremap <S-Tab> :set expandtab!<cr>:set expandtab?<cr>

" smart searching
set ignorecase
set smartcase
