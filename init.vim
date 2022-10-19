let g:mkdp_browser = '/Applications/Firefox.app/Contents/MacOS/firefox'
" use % to jump to matching delimiters of scope (braces, brackets)
" yc<   "mnemonic: you change indent
" luaeval('<expr>') -> value

let mapleader = ","
nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <Leader>da :Lexplore<CR>

" lua package.path = './lua/config/?.lua;' .. package.path
" searches every path on runtimepath for a directory called lua and tries to load plugins.lua
lua require('config/plugins')      -- Plugins
lua require('config/options')      -- Options
lua require('config/keymap')    -- Key Mappings
lua functions = require('config/functions')    -- Functions (namespaces, so does not make sense here)
lua require('config/custom_module_loader')
lua require('config/autocmds')
"--lua require()

" Exposes nvm node bin to nvim
let $PATH = '/Users/jonathan.komar/.local/share/nvm/versions/node/v16.17.0/bin:' . $PATH

set t_Co=256
set showtabline=2 " see help tabline (shows even if only one tabe open
nmap <buffer> <Enter> <C-]>

autocmd BufReadPost,FileReadPost *.plist nmap ;l :w<CR>:!clear; plutil -convert xml1 "%" && echo PList OK<CR>
autocmd BufWritePost,FileWritePost *.plist !plutil -convert binary1 <afile>
autocmd BufNewFile,BufRead Jenkinsfile :set filetype=groovy

" Set name of ctags file
set tags=tags
let g:netrw_preview = 1

"Leader dd: Will open Netrw in the directory of the current file.
"Leader da: Will open Netrw in the current working directory.

function! LoadConfig() 
  " This function is an example of how it could be done
  " Unnecessary because anything under lua dir will be loaded automatically
"  let myconflist = map(glob('~/.config/nvim/lua.d/**/*.lua', 1, 1), 'shellescape(v:val, 0)')
  let myluaconflist = glob('~/.config/nvim/lua.d/**/*.lua', 1, 1)
  for myconf in myluaconflist
    "echo 'Loading: ' . myconf
    execute 'luafile ' . myconf
  endfor
  let myvimscriptconflist = glob('~/.config/nvim/vimscript.d/**/*.vim', 1, 1)
  for myconf in myluaconflist
    execute 'source ' . myconf
  endfor
endfunction
" call LoadConfig()

if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
  "hi Pmenu ctermbg=blue
"set background=light
"luafile ~/.config/nvim/papercolor.lua
colorscheme PaperColor " called after all papercolor config loaded
endif

let g:minimap_width = 10
let g:minimap_auto_start = 0
let g:minimap_auto_start_win_enter = 0

" let g:ale_linters = {
" 			\ 'javascript': ['eslint'],
" 			\}
" mappings to nav the list of warnings provided by linter
" nmap <silent> [" <Plug>(ale_first)
" nmap <silent> [" <Plug>(ale_previous)
" nmap <silent> ]" <Plug>(ale_next)
" nmap <silent> ]" <Plug>(ale_last)

" naive way :: has problem that ESC no longer sendable to terminal
" tnoremap <Esc> <C-\><C-n>
" Allows for C-v + Esc to send literal ESC char to terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" restart a webserver
" find terminal buffer job id: echo b:terminal_job_id
" :call jobsend(1, "\<C-c>npm run server\<CR>")
" command! Restart call jobsend(1, "\<C-c>npm run server\<CR>")
" (double quotes required here)

" TODO move to mappings lua file
" nnoremap <C-s> :FZF<Cr>
" nnoremap <C-ä> <C-]><Cr>

" oddball is \<C-V> which requires double quotes for subsitution
let g:currentmode={
   \ 'n' : 'NORMAL ',
   \ 'v' : 'VISUAL ',
   \ 'V' : 'V-Line ',
   \ "\<C-V>" : 'V-Block ',
   \ 'i' : 'INSERT',
   \ 'R' : 'R ',
   \ 'Rv' : 'V Replace ',
   \ 'c' : 'Command ',
   \ 'no' : 'N·Operator Pending ',
   \ 'x22' : 'V·Block ',
   \ 's'  : 'Select ',
   \ 'S'  : 'S·Line ',
   \ 'x19' : 'S·Block ',
   \ 'cv' : 'Vim Ex ',
   \ 'ce' : 'Ex ',
   \ 'r'  : 'Prompt ',
   \ 'rm' : 'More ',
   \ 'r?' : 'Confirm ',
   \ '!'  : 'Shell ',
   \ 't'  : 'Terminal '
   \}

function! GitBranch()
  " Made obsolete
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

" This function could be used in status line with set statusline+=%{StatuslineGit()}
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" Manually set the status line color.
" hi: short for highligh group colors
" hi StatusLineTerm ctermbg=24 ctermfg=254 guibg=#004f87 guifg=#e4e4e4
" hi StatusLineTermNC ctermbg=252 ctermfg=238 guibg=#d0d0d0 guifg=#444444
" hi MyCustomColor ctermfg=210 ctermbg=238
hi InsertColor ctermfg=112 ctermbg=238
hi NormalColor ctermfg=210 ctermbg=238
hi ReplaceColor ctermfg=160 ctermbg=238
hi VisualColor ctermfg=128 ctermbg=238

" " escape spaces with backslash
" " % control char/format char: ex add padding with [%4l]
" " %F is full path of file. %.20F adjusts max width
" " hfill with %=
" " default alignment is right, override: %-, 0-pad %0
" " coloring: set statusline+=%#HLname#
" " HLname can be any of the colors returned by the highlight command.
" " set statusline+=%* " Restore default colors
" set statusline= " reset
" set statusline+=%#Normalcolor#%{mode()=='n'?'':''}
" set statusline+=%#ReplaceColor#%{mode()=='r'?'':''}
" set statusline+=%#VisualColor#%{mode()=='v'?'':''}
" set statusline+=%#InsertColor#%{mode()=='i'?'':''}
" set statusline+=%f
" "set statusline+=::
" "set statusline+=%{StatuslineGit()}
" set statusline+=::
" set statusline+=Enc(%{&fileencoding?&fileencoding:&encoding}) " file encoding
" set statusline+=\  " space
" set statusline+=EOL(%{&fileformat}) " file format
" set statusline+=\  " space
" set statusline+=Type(%y) " filetype
" set statusline+=%r " 
" set statusline+=\  " space
" set statusline+=Char(%04b,\ 0x%04B) " print char as int
" set statusline+=\  " space
" set statusline+=%= "hfill
" set statusline+=%-10{toupper(g:currentmode[mode()])}
" set statusline+=\ %p%% " percentage through file
" set statusline+=\ Line\ %-4l/%-4L:Column\ %-4c  "line num: column num
" set statusline+=\ 
" " show statusline regardless of # of buffers
" set laststatus=2

"normal mode non-recursive mappping to the key F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//ec<Bar>:let @/=_s<Bar><CR>

function! PrintRuntimePath()
  echo join(split(&runtimepath, ','), "\n")
endfunction

"let g:netrw_banner = 0
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25



" BEGIN vim-startify config
" This is one way to save sessions SSave and SLoad
let g:startify_session_dir = '~/.local/share/nvim/startify'
" let g:startify_lists = [\
" END vim-startify config
"
function! PrintCurrentWorkingDirectory()
  lua print(vim.fn.getcwd())
endfunction

" use leader following by f key to us LSP server to format the current buffer
"nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.format()<CR>
"

 let g:clipboard = {
          \   'name': 'myClipboard',
          \   'copy': {
          \      '+': ['tmux', 'load-buffer', '-'],
          \      '*': ['tmux', 'load-buffer', '-'],
          \    },
          \   'paste': {
          \      '+': ['tmux', 'save-buffer', '-'],
          \      '*': ['tmux', 'save-buffer', '-'],
          \   },
          \   'cache_enabled': 1,
          \ }

" set paste " allow pasting from clipboard with proper indentation also disabled formatoptions for formatting comments


" START BLOCK from https://medium.com/geekculture/neovim-configuration-for-beginners-b2116dbbde84
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
" END BLOCK

" move between panes to left/bottom/top/right
" I use tmux bindings for this: tmux checks whether pane has nvim running


" In Lua:
" vim.api.nvim_set_var to set internal variables.
" vim.api.nvim_set_option to set options.
" vim.api.nvim_set_keymap to set key mappings.
" -- LEADER
" -- These keybindings need to be defined before the first /
" -- is called; otherwise, it will default to "\"
" vim.g.mapleader = ","
" vim.g.localleader = "\\"


" Note that here you called vim.g instead of vim.api.nvim_set_var. That’s
" because Neovim offers a helpful set of meta-accessors that you can use to
" reduce the amount of code contained in your file. Some of the available
" meta-accessors for the vim.api.nvim_set_var command are as follows:
" 
" vim.g: maps to vim.api.nvim_set_var; sets global variables.
" vim.o: maps to vim.api.nvim_win_set_var; sets variables scoped to a given window.
" vim.b; maps to vim.api.nvim_buf_set_var; sets variables scoped to a given buffer.
lua print("Leader is: " .. vim.api.nvim_get_var('mapleader'))

" change help to tag help
cabbrev help tab help
" cabbrev turns first arg into the rest args 


