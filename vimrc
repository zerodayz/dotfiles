" Global Settings

" Turns on the Filetype
filetype on
" Loads corresponding plugins to the different types detected
filetype plugin on

" Automatic indentation
filetype indent on

" Syntax highlighting
syntax enable
" Allows you to replace the default scheme with specified syntax highlighting
syntax on

set nocompatible " Turn off compatibility mode
set incsearch " Turn on the real-time search
set ignorecase " Search case in-sensitive
set wildmenu " Autocomplete vim commands
set autoread " Files are automatically updated
set gcr=a:block-blinkon0 " Is disabled
set laststatus=2 " Always show the status bar
set ruler " Display the cursor position
set number " Shows the line numbers
set cursorline " Highlight current line
set cursorcolumn " Highlight current column
set hlsearch " Highlight search results
" set nowrap " Disable nowrap
set backspace=2 " Backspace is active
"set backspace=indent,eol,start

" Expand the tabs into spaces
set expandtab
" Set the number of spaces to 4
set tabstop=4
" When formatting the tab, the number of spaces is 4
set shiftwidth=4
" Let vim treat a continuous number of spaces as tab
set softtabstop=4
" Folding based on indentation on grammar
set foldmethod=syntax
" Turn off the fold when starting vim
set nofoldenable

" Open the last file off the location
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Global Shortcuts

" Set the leader key '
"let mapleader="\<space>"
let mapleader="'"

" '+y yank the selected text
vnoremap <Leader>y "+y

" '+p pastes from system clip
nmap <Leader>p "+p

" '+q closes the vim
nmap <Leader>q :q<CR>

" '+w save the contents
nmap <Leader>w :w<CR>

" '+W save the contents when you forgot to switch to root
nmap <Leader>W :w !sudo tee %<CR>

" '+WQ save all windows contents and exit vim
"nmap <Leader>WQ :wa<CR>:q<CR>

" '+Q do not save anything and exit
"nmap <Leader>Q :qa!<CR>

" '+l Jump to right
nnoremap <Leader>l <C-W>l

" '+h Jump to left
nnoremap <Leader>h <C-W>h

" '+k Jump to top
nnoremap <Leader>k <C-W>k

" '+j Jump down
nnoremap <Leader>j <C-W>j

" '+N no highlight
nmap <Leader>N :noh<CR>

" '+M Jump between loops
nmap <Leader>M %

nnoremap <Leader>g <C-]>
nnoremap <Leader>b <C-t>


" Plugins

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle plugins must be between vundle#begin() and vundle#end()
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-powerline' "status
Plugin 'octol/vim-cpp-enhanced-highlight' "c++ syntax highlight
Plugin 'kshenoy/vim-signature' "bookmark visualization plugin
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines' "bookmark line highlight
Plugin 'majutsushi/tagbar' "taglist
Plugin 'scrooloose/nerdcommenter' "multi-line comment，'+cc, '+cu delets the comment
Plugin 'scrooloose/nerdtree' "file browser
Plugin 'Valloric/YouCompleteMe' "auto complete
Plugin 'kien/ctrlp.vim' "ctrl+p search
Plugin 'vim-scripts/grep.vim' " can use :grep
Plugin 'Lokaltog/vim-easymotion' "'+f fast jump
Plugin 'vim-scripts/ShowTrailingWhitespace.git' "highlight extra space at the end
Plugin 'vim-scripts/indentpython.vim.git'
Plugin 'vim-scripts/Solarized.git' "theme plugin
Plugin 'nathanaelkane/vim-indent-guides.git' "indent displau
"Plugin 'vim-scripts/indexer.tar.gz' "Automatically generated tafs
"Plugin 'vim-scripts/DfrankUtil' "indexer dependencies
"Plugin 'vim-scripts/vimprj' "indexer dependencies
Plugin 'davidhalter/jedi-vim' "python complements.
Plugin 'vim-scripts/Markdown'
Plugin 'tpope/vim-surround'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'ConradIrwin/vim-bracketed-paste' "use bracketed-paste mode to avoid formatting issues
Plugin 'johngrib/vim-game-code-break'
" End of plugin list
call vundle#end()
filetype on

" Powerline settings
" Set the status bar theme style
let g:Powerline_colorscheme='solarized256'



" Set tagbar
" Set tagbar location
let tagbar_left=1
" " Set the shortcut for display/hide of the label list subwindow ：identifier list by tag
nnoremap <Leader>t :TagbarToggle<CR>
" " Set the width of the label subwindow
let tagbar_width=32
" " tagbar doesnt display redundant help info
let g:tagbar_compact=1
" " Set ctags to which tags are generate

" signature set
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" Use NERDTree plugin to view project file. Set the shortcut key ：file list
nmap <Leader>f :NERDTreeToggle<CR>
" Set the NERDTree subwindow width
let NERDTreeWinSize=32
" Set NERDTREE subwindow location
let NERDTreeWinPos="right"
" Show hidde files
let NERDTreeShowHidden=1
" The redundant help information is not displayed in the NERDTree subwindow
let NERDTreeMinimalUI=1
" Delete the file automatically delete the file corresponding to the buffer
let NERDTreeAutoDeleteBuffer=1

" YCM complete menu color
" Menu
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" Item
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" The complement function is also valid in comments
let g:ycm_complete_in_comments=1
" Allow vim to load the .ycm_extra_conf.py file without prompting
let g:ycm_confirm_extra_conf=0
" Open the YCM tag completion engine
let g:ycm_collect_identifiers_from_tags_files=1
" Introduce C ++ standard library tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags

" YCM integrates the OmniCppComplete completion engine to set its shortcut keys
"inoremap <leader>; <C-x><C-o>
" Completed content does not appear as a split sub-window, only the completion list is displayed
set completeopt-=preview
" From the first type of characters to start listing the match
let g:ycm_min_num_of_chars_for_completion=1
" Suppress caching matches, each time a match is regenerated
let g:ycm_cache_omnifunc=0
"Syntax keyword complements
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


""" color settings
set t_Co=256
if has("gui_running")
    set guioptions=gR
    set mousemodel=popup
    set background=light
    ""hi LineNr cterm=bold guibg=black guifg=white
    ""hi CursorLine cterm=none ctermbg=lightgray ctermfg=none
    ""hi CursorColumn cterm=none ctermbg=lightgray ctermfg=none
else
    set background=dark
    ""hi LineNr cterm=bold ctermbg=black ctermfg=white
    ""hi CursorLine cterm=none ctermbg=darkgray ctermfg=none
    ""hi CursorColumn cterm=none ctermbg=darkgray ctermfg=none
endif

:silent! colorscheme solarized
"colorscheme default

" indent guides
"let g:indent_guides_enable_on_vim_startup=1
" Visualization from the second layer shows indentation
let g:indent_guides_start_level=2
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd  guibg=red   ctermbg=3
"hi IndentGuidesEven guibg=green ctermbg=4
" Color block width
let g:indent_guides_guide_size=1
" Shortcut key i on / off indentation visualization
noremap <Leader>sj :IndentGuidesToggle<CR>

" Each line can not exceed 80 characters, otherwise it is highlighted
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/
