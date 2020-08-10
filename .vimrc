set rtp+=/usr/lib/python3.8/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256

execute pathogen#infect()
map <C-n> :NERDTreeToggle<CR>

set background=dark
set tabstop=4
syntax on
filetype plugin indent on
set number
set smartindent
set numberwidth=3
set shiftwidth=4
