#!/bin/bash
## Ubuntu 18.04 setting for GW
## Author: Leon.Lin    2019.11.26
## Modified: Kai.Chen   2019.12.12

# User account and password input
read -sp "Please enter your sudo password: " password
echo 

# apt and apt-get update/upgrade
echo -e $password | sudo -S apt-get -y update
echo -e $password | sudo -S apt-get -y upgrade
echo -e $password | sudo -S apt -y update
echo -e $password | sudo -S apt -y upgrade

# cmake update
echo -e $password | sudo -S apt -y autoremove cmake
echo -e $password | sudo -SE add-apt-repository ppa:george-edison55/cmake-3.x
echo -e $password | sudo -SE apt -y update
echo -e $password | sudo -SE apt -y install cmake

# Install vim, git, rar, unrar, htop, screen, unzip, gnome-tweak-tool
# Note: vim-gtk support clipboard yanking & pasting
echo -e $password | sudo -S apt -y install vim-gtk git rar unrar htop screen unzip gnome-tweak-tool

# Install Chinese spelling
echo -e $password | sudo -S apt -y install hime

# # Install Slack
# echo -e $password | sudo -S snap install slack --classic

# # ssh
# echo -e $password | sudo -S apt -y install openssh-server
# ssh-keygen -t rsa -b 4096 -C "leonlin@gallopwave.com"

# Install vlc
echo -e $password | sudo -S snap install vlc --classic

# eigen3, boost
echo -e $password | sudo -S apt -y install libeigen3-dev libboost-dev

# Python3
echo -e $password | sudo -S apt install -y python3-pip python3-dev
echo -e $password | sudo -S apt -y install build-essential pkg-config libopenblas-dev liblapack-dev
# Numpy, scipy, pandas, matplotlib
echo -e $password | sudo -S pip3 install numpy scipy pandas matplotlib jupyter

# OpenCV
echo -e $password | sudo -S apt -y install libgtk2.0-dev libavcodec-dev libavformat-dev libswscale-dev
echo -e $password | sudo -SE add-apt-repository “deb http://security.ubuntu.com/ubuntu xenial-security main”
echo -e $password | sudo -S apt -y update
echo -e $password | sudo -S apt -y install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
cd ~/
mkdir ~/opencv
cd ~/opencv
git clone -b 4.2 https://github.com/opencv/opencv.git
git clone -b 4.2 https://github.com/opencv/opencv_contrib.git
cd ~/opencv
mkdir ~/opencv/build
cd ~/opencv/build
export OpenCV_DIR=~/opencv
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=~/opencv/opencv_contrib/modules/ ../opencv
make -j7 
echo -e $password | sudo -S make install

# TensorFlow
echo -e $password | sudo -S pip3 install --upgrade tensorflow

# # # Dropbox
# echo -e $password | sudo -S apt -y install nautilus-dropbox
# nautilus --quit
# dropbox update
# # dropbox start

#OPENCV example testing
cd ~/opencv/opencv/samples/cpp/example_cmake/
mkdir -p build && cd build/
cmake ..
make
echo "***Press ESC to exit***"
./opencv_example
cd ./../
sudo rm -r build

# # vim (v8.2)
# echo -e $password | sudo -S add-apt-repository -y ppa:jonathonf/vim
# echo -e $password | sudo -S apt -y update
# # echo -e $password | sudo -S apt -y install vim
# echo -e $password | sudo -S apt -y install ctags ack
# echo -e $password | sudo -S apt -y install mono-complete golang nodejs default-jdk npm

# # VIM configuration/plug-ins
# cd ~
# mkdir -p ~/.vim/bundle
# cd .vim/bundle/
# git clone https://github.com/VundleVim/Vundle.vim.git
# # Write .vimrc
# echo \
# "set nu     \" Enable line numbers
# syntax on  \" Enable syntax highlighting
# \" How many columns of whitespace a \t is worth
# set tabstop=2 
# \" How many columns of whitespace a \"level of indentation\" is worth
# set shiftwidth=2 
# \" Use spaces when tabbing
# set expandtab
# set incsearch  \" Enable incremental search
# set hlsearch   \" Enable highlight search
# \" set termwinsize=12x0   \" Set terminal size
# set splitright         \" Always split right
# set mouse=a            \" Enable mouse drag on window splits
# set colorcolumn=80     \" 80-column indication
# \" set scrolloff=999      \" make 'search' item and 'scroll' centerized
# set cursorline
# set hidden
# \" Split navigation
# \" nnoremap <C-J> <C-W><C-J>
# \" nnoremap <C-K> <C-W><C-K>
# \" nnoremap <C-L> <C-W><C-L>
# \" nnoremap <C-H> <C-W><C-H>

# \" Enable 'alt' in vim under Gnome terminal (Ubuntu)
# let c='a'
# while c <= 'z'
#   exec \"set <A-\".c.\">=\e\".c
#   exec \"imap \e\".c.\" <A-\".c.\">\"
#   let c = nr2char(1+char2nr(c))
# endw

# set timeout ttimeoutlen=50

# set nocompatible              \" be iMproved, required
# filetype off                  \" required

# \" set the runtime path to include Vundle and initialize
# set rtp+=~/.vim/bundle/Vundle.vim
# call vundle#begin('~/.vim/plugged')
# \" alternatively, pass a path where Vundle should install plugins
# \"call vundle#begin('~/some/path/here')

# \" let Vundle manage Vundle, required
# Plugin 'VundleVim/Vundle.vim'

# \" The following are examples of different formats supported.
# \" Keep Plugin commands between vundle#begin/end.
# \" plugin on GitHub repo
# Plugin 'tpope/vim-fugitive'         \" Git tools
# Plugin 'airblade/vim-gitgutter'
# Plugin 'sheerun/vim-polyglot'       \" Syntax highlighting
# Plugin 'cocopon/iceberg.vim'        \" Color scheme
# Plugin 'arcticicestudio/nord-vim'
# Plugin 'Badacadabra/vim-archery'
# Plugin 'kristijanhusak/vim-hybrid-material'
# Plugin 'scheakur/vim-scheakur'
# Plugin 'lifepillar/vim-solarized8'
# Plugin 'jiangmiao/auto-pairs'    \" brackets, parenthesis and quotes completion
# Plugin 'preservim/nerdtree'      \" Filesystem explorer
# Plugin 'preservim/tagbar'        \" tagbar (require ctags)
# Plugin 'dyng/ctrlsf.vim'         \" search in files (require ack)
# Plugin 'derekwyatt/vim-fswitch'  \" switch between *.h & *.cpp
# Plugin 'derekwyatt/vim-protodef' \" pulling prototypes into implementation files
# Plugin 'Yggdroot/indentLine'     \" indent visualization
# Plugin 'matze/vim-move'          \" move lines and selections
# Plugin 'ycm-core/YouCompleteMe'  \" auto-complete
# Plugin 'rhysd/vim-clang-format'  \" clang-format support
# Plugin 'craigemery/vim-autotag'  \" auto update ctags files

# \" plugin from http://vim-scripts.org/vim/scripts.html
# \" Plugin 'L9'
# \" Git plugin not hosted on GitHub
# Plugin 'git://git.wincent.com/command-t.git'
# \" git repos on your local machine (i.e. when working on your own plugin)
# \" Plugin 'file:///home/gmarik/path/to/plugin'
# \" The sparkup vim script is in a subdirectory of this repo called vim.
# \" Pass the path to set the runtimepath properly.
# Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
# \" Install L9 and avoid a Naming conflict if you've already installed a
# \" different version somewhere else.
# \" Plugin 'ascenator/L9', {'name': 'newL9'}

# \" All of your Plugins must be added before the following line
# call vundle#end()            \" required
# filetype plugin indent on    \" required

# set background=dark           \" dark or light
# colorscheme hybrid_material   \" select a color scheme

# \" auto-pairs config
# let g:AutoPairsShortcutToggle = '<C-P>'

# \" NERDTree config
# nmap <F2> :NERDTreeToggle<CR>
# \" Show the bookmarks table
# let NERDTreeShowBookmarks = 1
# \" Show hidden files
# let NERDTreeShowHidden = 1
# \" Hide line numbers
# let NERDTreeShowLineNumbers = 0
# \" Use the minimal menu (m)
# let NERDTreeMinimalMenu = 1
# \" Panel opens on the left side
# let NERDTreeWinPos = \"left\"
# \" Set panel width to 31 columns
# let NERDTreeWinSize = 31

# \" tarbar config
# \" Focus the panel when opening it
# let g:tagbar_autofocus = 1
# \" Highlight the active tag
# let g:tagbar_autoshowtag = 1
# \" Make panel vertical and place on the right
# let g:tagbar_position = 'botright vertical'
# \" Mapping to open and close the panel
# nmap <F8> :TagbarToggle<CR>

# \" ctrlsf config
# \" Use the ack tool as the backend
# let g:ctrlsf_backend = 'ack'
# \" Auto close the results panel when opening a file
# let g:ctrlsf_auto_close = { \"normal\":0, \"compact\":0 }
# \" Immediately switch focus to the search window
# let g:ctrlsf_auto_focus = { \"at\":\"start\" }
# \" Don't open the preview window automatically
# let g:ctrlsf_auto_preview = 0
# \" Use the smart case sensitivity search scheme
# let g:ctrlsf_case_sensitive = 'smart'
# \" Normal mode, not compact mode
# let g:ctrlsf_default_view = 'normal'
# \" Use absoulte search by default
# let g:ctrlsf_regex_pattern = 0
# \" Position of the search window
# let g:ctrlsf_position = 'right'
# \" Width or height of search window
# let g:ctrlsf_winsize = '46'
# \" Search from the current working directory
# let g:ctrlsf_default_root = 'project'
# \" (Ctrl+F) Open search prompt (Normal Mode)
# nmap <C-F>f <Plug>CtrlSFPrompt 
# \" (Ctrl-F + f) Open search prompt with selection (Visual Mode)
# xmap <C-F>f <Plug>CtrlSFVwordPath
# \" (Ctrl-F + F) Perform search with selection (Visual Mode)
# xmap <C-F>F <Plug>CtrlSFVwordExec
# \" (Ctrl-F + n) Open search prompt with current word (Normal Mode)
# nmap <C-F>n <Plug>CtrlSFCwordPath
# \" (Ctrl-F + o )Open CtrlSF window (Normal Mode)
# nnoremap <C-F>o :CtrlSFOpen<CR>
# \" (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
# nnoremap <C-F>t :CtrlSFToggle<CR>
# \" (Ctrl-F + t) Toggle CtrlSF window (Insert Mode)
# inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

# \" fswitch config
# au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
# au! BufEnter *.h let b:fswitchdst = 'cpp,c'
# nmap <C-Z> :vsplit <bar> :wincmd l <bar> :FSRight<CR>

# \" protodef
# \" Pull in prototypes
# nmap <buffer> <silent> <leader> ,PP
# \" Pull in prototypes without namespace definition
# nmap <buffer> <silent> <leader> ,PN

# \" YouCompleteMe
# \" let g:ycm_max_num_candidates = 0
# let g:ycm_confirm_extra_conf = 0
# let g:SuperTabClosePreviewOnPopupClose = 1
# let g:ycm_autoclose_preview_window_after_insertion = 1
# let g:ycm_autoclose_preview_window_after_completion = 1
# let g:ycm_clangd_args = ['--header-insertion', 'never']
# nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
# nnoremap <leader>g :YcmCompleter GoTo<CR>

# \" clang-format support
# let g:clang_format#code_style='google'
# nnoremap <C-K> :ClangFormat<CR>
# xnoremap <C-K> :ClangFormat<CR>
# \" autocmd FileType c,cpp ClangFormatAutoEnable

# \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"
# \" CSCOPE settings for vim           
# \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"
# \"
# \" This file contains some boilerplate settings for vim's cscope interface,
# \" plus some keyboard mappings that I've found useful.
# \"
# \" USAGE: 
# \" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
# \"               'plugin' directory in some other directory that is in your
# \"               'runtimepath'.
# \"
# \" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
# \"               your ~/.vimrc file (or cut and paste it into your .vimrc).
# \"
# \" NOTE: 
# \" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
# \" keeps timing you out before you can complete them, try changing your timeout
# \" settings, as explained below.
# \"
# \" Happy cscoping,
# \"
# \" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
# \"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"


# \" This tests to see if vim was configured with the '--enable-cscope' option
# \" when it was compiled.  If it wasn't, time to recompile vim... 
# if has(\"cscope\")

#     \"\"\"\"\"\"\"\"\"\"\"\"\" Standard cscope/vim boilerplate

#     \" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
#     set cscopetag

#     \" check cscope for definition of a symbol before checking ctags: set to 1
#     \" if you want the reverse search order.
#     set csto=0

#     \" add any cscope database in current directory
#     if filereadable(\".vim_cfg/cscope.out\")
#         cs add .vim_cfg/cscope.out  
#     \" else add the database pointed to by environment variable 
#     elseif \$CSCOPE_DB != \"\"
#         cs add \$CSCOPE_DB
#     endif

#     \" show msg when any other cscope db added
#     set cscopeverbose  


#     \"\"\"\"\"\"\"\"\"\"\"\"\" My cscope/vim key mappings
#     \"
#     \" The following maps all invoke one of the following cscope search types:
#     \"
#     \"   's'   symbol: find all references to the token under cursor
#     \"   'g'   global: find global definition(s) of the token under cursor
#     \"   'c'   calls:  find all calls to the function name under cursor
#     \"   't'   text:   find all instances of the text under cursor
#     \"   'e'   egrep:  egrep search for the word under cursor
#     \"   'f'   file:   open the filename under cursor
#     \"   'i'   includes: find files that include the filename under cursor
#     \"   'd'   called: find functions that function under cursor calls
#     \"
#     \" Below are three sets of the maps: one set that just jumps to your
#     \" search result, one that splits the existing vim window horizontally and
#     \" diplays your search result in the new window, and one that does the same
#     \" thing, but does a vertical split instead (vim 6 only).
#     \"
#     \" I've used CTRL-\\ and CTRL-@ as the starting keys for these maps, as it's
#     \" unlikely that you need their default mappings (CTRL-\\'s default use is
#     \" as part of CTRL-\\ CTRL-N typemap, which basically just does the same
#     \" thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
#     \" If you don't like using 'CTRL-@' or CTRL-\\, , you can change some or all
#     \" of these maps to use other keys.  One likely candidate is 'CTRL-_'
#     \" (which also maps to CTRL-/, which is easier to type).  By default it is
#     \" used to switch between Hebrew and English keyboard mode.
#     \"
#     \" All of the maps involving the <cfile> macro use '^<cfile>$': this is so
#     \" that searches over '#include <time.h>\" return only references to
#     \" 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
#     \" files that contain 'time.h' as part of their name).


#     \" To do the first type of search, hit 'CTRL-\\', followed by one of the
#     \" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
#     \" search will be displayed in the current window.  You can use CTRL-T to
#     \" go back to where you were before the search.  
#     \"

#     nmap <C-\\>s :cs find s <C-R>=expand(\"<cword>\")<CR><CR>	
#     nmap <C-\\>g :cs find g <C-R>=expand(\"<cword>\")<CR><CR>	
#     nmap <C-\\>c :cs find c <C-R>=expand(\"<cword>\")<CR><CR>	
#     nmap <C-\\>t :cs find t <C-R>=expand(\"<cword>\")<CR><CR>	
#     nmap <C-\\>e :cs find e <C-R>=expand(\"<cword>\")<CR><CR>	
#     nmap <C-\\>f :cs find f <C-R>=expand(\"<cfile>\")<CR><CR>	
#     nmap <C-\\>i :cs find i ^<C-R>=expand(\"<cfile>\")<CR>$<CR>
#     nmap <C-\\>d :cs find d <C-R>=expand(\"<cword>\")<CR><CR>	


#     \" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
#     \" makes the vim window split horizontally, with search result displayed in
#     \" the new window.
#     \"
#     \" (Note: earlier versions of vim may not have the :scs command, but it
#     \" can be simulated roughly via:
#     \"    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand(\"<cword>\")<CR><CR>	

#     nmap <C-@>s :scs find s <C-R>=expand(\"<cword>\")<CR><CR>	
#     nmap <C-@>g :scs find g <C-R>=expand(\"<cword>\")<CR><CR>	
#     nmap <C-@>c :scs find c <C-R>=expand(\"<cword>\")<CR><CR>	
#     nmap <C-@>t :scs find t <C-R>=expand(\"<cword>\")<CR><CR>	
#     nmap <C-@>e :scs find e <C-R>=expand(\"<cword>\")<CR><CR>	
#     nmap <C-@>f :scs find f <C-R>=expand(\"<cfile>\")<CR><CR>	
#     nmap <C-@>i :scs find i ^<C-R>=expand(\"<cfile>\")<CR>$<CR>	
#     nmap <C-@>d :scs find d <C-R>=expand(\"<cword>\")<CR><CR>	


#     \" Hitting CTRL-space *twice* before the search type does a vertical 
#     \" split instead of a horizontal one (vim 6 and up only)
#     \"
#     \" (Note: you may wish to put a 'set splitright' in your .vimrc
#     \" if you prefer the new window on the right instead of the left

#     nmap <C-@><C-@>s :vert scs find s <C-R>=expand(\"<cword>\")<CR><CR>
#     nmap <C-@><C-@>g :vert scs find g <C-R>=expand(\"<cword>\")<CR><CR>
#     nmap <C-@><C-@>c :vert scs find c <C-R>=expand(\"<cword>\")<CR><CR>
#     nmap <C-@><C-@>t :vert scs find t <C-R>=expand(\"<cword>\")<CR><CR>
#     nmap <C-@><C-@>e :vert scs find e <C-R>=expand(\"<cword>\")<CR><CR>
#     nmap <C-@><C-@>f :vert scs find f <C-R>=expand(\"<cfile>\")<CR><CR>	
#     nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand(\"<cfile>\")<CR>$<CR>	
#     nmap <C-@><C-@>d :vert scs find d <C-R>=expand(\"<cword>\")<CR><CR>


#     \"\"\"\"\"\"\"\"\"\"\"\"\" key map timeouts
#     \"
#     \" By default Vim will only wait 1 second for each keystroke in a mapping.
#     \" You may find that too short with the above typemaps.  If so, you should
#     \" either turn off mapping timeouts via 'notimeout'.
#     \"
#     \"set notimeout 
#     \"
#     \" Or, you can keep timeouts, by uncommenting the timeoutlen line below,
#     \" with your own personal favorite value (in milliseconds):
#     \"
#     \"set timeoutlen=4000
#     \"
#     \" Either way, since mapping timeout settings by default also set the
#     \" timeouts for multicharacter 'keys codes' (like <F1>), you should also
#     \" set ttimeout and ttimeoutlen: otherwise, you will experience strange
#     \" delays as vim waits for a keystroke after you hit ESC (it will be
#     \" waiting to see if the ESC is actually part of a key code like <F1>).
#     \"
#     \"set ttimeout 
#     \"
#     \" personally, I find a tenth of a second to work well for key code
#     \" timeouts. If you experience problems and have a slow terminal or network
#     \" connection, set it higher.  If you don't set ttimeoutlen, the value for
#     \" timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
#     \"
#     \"set ttimeoutlen=100

#     \" Update the cscope database
#     nmap <F6> :!find . -name '*.h' -o -name '*.hpp' -o -name '*.c' -o -name '*.cpp' -o -name '*.cc' >> .vim_cfg/cscope.file<CR>
#       \:!cscope -Rbq -i .vim_cfg/cscope.file -f .vim_cfg/cscope.out<CR>
#       \:cs reset<CR>

# endif

# \" ctags
# set tags=./tags,./TAGS,tags,.tags,./.vim_cfg/tags;~,TAGS;~

# \" AutoTag
# let g:autotagTagsFile=\"./.vim_cfg/tags\"

# \" To ignore plugin indent changes, instead use:
# \"filetype plugin on
# \"
# \" Brief help
# \" :PluginList       - lists configured plugins
# \" :PluginInstall    - installs plugins; append \`!\` to update or just :PluginUpdate
# \" :PluginSearch foo - searches for foo; append \`!\` to refresh local cache
# \" :PluginClean      - confirms removal of unused plugins; append \`!\` to auto-approve removal
# \"
# \" see :h vundle for more details or wiki for FAQ
# \" Put your non-Plugin stuff after this line" > ~/.vimrc
# # YouCompleteMe installation
# cd ~/.vim/plugged/YouCompleteMe/
# echo -e $password | sudo -S apt -y install gcc-8 g++-8
# echo -e $password | sudo -S update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7
# echo -e $password | sudo -S update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8
# python3 install.py --clangd-completer --all
# cd ~
# # ctags, cscope installation
# # echo -e $password | sudo -S apt-get -y install ctags
# echo -e $password | sudo -S apt-get -y install exuberant-ctags
# echo -e $password | sudo -S apt -y install cscope
# echo \
# "--recurse=yes
# --tag-relative=yes
# --exclude=.git
# --exclude=.svn
# --exclude=BUILD
# --exclude=build*/*
# --exclude=log*/*
# --exclude=data*/*
# -f .vim_cfg/tags" > ~/.ctags
# echo \
# "# alias for ctags & cscope setup for vim
# alias vim-setup='mkdir .vim_cfg && 
#   ctags && 
#   find . -name \"*.h\" -o -name \"*.hpp\" -o -name \"*.c\" -o -name \"*.cpp\" -o -name \"*.cc\" >> .vim_cfg/cscope.file && 
#   cscope -Rbq -i .vim_cfg/cscope.file -f .vim_cfg/cscope.out'" >> ~/.bashrc

# # Install plug-in
# vim +PluginInstall +qall

# Remove the root password variable
unset $password

echo "Please use 'source ~/.bashrc' first."
