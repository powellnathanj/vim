" Pathogen
  execute pathogen#infect()

" Filetype etc
  filetype plugin indent on
    
" Set the Leader key
  let mapleader=','

" If I wanted to use vi, I'd use vi
  set nocompatible

" FreeBSD doesn't set this by default.
  set backspace=indent,eol,start

" Try it
  nmap <tab> :bn<cr>
  nmap <s-tab> :bp<cr>

" Colorize me
  syntax enable

  set bg=dark

  set t_Co=256
  colorscheme desert
  highlight Cursor guifg=white guibg=white

" Indentation
  set expandtab
  set shiftwidth=2
  set tabstop=2
  set softtabstop=2
  set smartindent

  set paste

" Toggle hidden chars with ,l
  nmap <leader>l :set list!<CR>

" No highlight
  nmap <leader><leader> :noh<CR>

" Allows buffers to be back grounded without being written
  set hidden

" Moar hx
  set history=1000

" Done together, unless you specify case, case doesn't matter
  set ignorecase 
  set smartcase

" Set the title
  set title

" Take me back to the place I was last time!
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif
  endif

" Toggle NERDTree
  nmap <silent> <Leader>d :NERDTreeToggle ~/src<cr>
  let NERDTreeCaseSensitiveSort=1

" Vimclojure
  let clj_highlight_builtins = 1
  let clj_highlight_contrib = 1
  let clj_paren_rainbow = 1

  let clj_want_gorilla = 1

  let vimclojure#NailgunClient = "/opt/clojure/ng"
 
" Bclose - Close a buffer without closing the split
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")
 
    if buflisted(l:alternateBufNum)
  set pastetoggle=<F8>
        buffer #
    else
        " this try-catch block is disgusting
        try
            bprev
        catch /.*/ " catch if we can't switch to previous
        endtry
    endif
 
    if bufnr("%") == l:currentBufNum
        new
    endif
 
    if bufloaded(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
 
command! Bclose call <SID>BufcloseCloseIt()

" set et, not good for Makefiles
autocmd BufRead,BufNewFile   Makefile set noexpandtab

" set us up the arduino
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile Vagrantfile set filetype=ruby
au BufRead,BufNewFile *.tf set filetype=ruby

autocmd BufNewFile,BufRead *.json set filetype=javascript

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
