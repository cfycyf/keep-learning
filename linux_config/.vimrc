" VIM 配置（终端环境）
" Iceway Zhang
" {vim:set shiftwidth=4 tabstop=4 softtabstop=4 expandtab:} "

""" ### VIM 特性配置 {{{
set nocompatible			" 不使用vi兼容模式

set ruler				" 显示状态栏光标标尺
"set cursorline				" 突出显示当前行
set number				" 显示行号
"set relativenumber			" 显示相对（当前光标所在行）行号而不是绝对行号
set hlsearch				" 高亮搜索结果
set incsearch				" 输入搜索内容时就同步显示搜索结果
set ignorecase				" 搜索时大小写不敏感
"set nowrap				" 长度超过窗口宽度不要换行显示
"set list				" 让VIM显示空格、tab、换行等不可见字符
"set listchars=nbsp:¬,trail:·,tab:»	" 设置VIM把空格、换行、tab显示为什么字符
set scrolloff=3				" 光标移动到顶部和底部时自动保持3行距离
set showmatch				" 显示自动匹配到的对应括号
set showmode				" 让VIM在窗口最低下显示当前模式，如--INSERT--等
set showcmd				" 在命令模式下输入命令时，同步显示已经键入的命令内容
set nobackup				" 保存文件时，不要创建备份文件
set textwidth=0				" 一行内输入字符达到多少时自动换行，0表示不限制
set history=500				" 记录的历史命令个数

set shiftwidth=4			" 设定VIM的自动缩进，以及>和<命令时移动的空白长度
set softtabstop=4			" 按下tab时，插入的是空格和tab制表符的混合，具体方式参见:help softtabstop
set tabstop=4				" 设定tab长度为4字节
"set expandtab				" 键入tab时，自动用空格替换tab，空格长度等于tabstop的设置
"set mouse=a
set backspace=indent,eol,start		" 退格键（backspace）默认工作vi模式下。该设置可以让退格键工作在大家熟悉的方式下。
					" indent: 如果设置了:set indent等自动缩进，按退格键会删掉这个缩进。
					" eol: 如果插入模式下在行开头，设置了eol后按下退格键会合并到上一行。
					" start: 若不设置为start，则在回退时，只能回退删除自己新添加的字符，原来已经存在的字符无法回退删除。
set pastetoggle=<F3>			" 按下F3键可以切换粘贴插入模式[Insert (paste)]和普通插入模式。
set viminfo='100,f1,<500

"map <C-H> <C-W>h
"map <C-J> <C-W>j
"map <C-K> <C-W>k
"map <C-L> <C-W>l
cmap w!! w !sudo tee >/dev/null %

" 不重启VIM，让配置文件保存后立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 打开文件后，自动跳转到上一次退出时所在行
autocmd BufReadPost *
    \ if line("`\"") > 1 && line("`\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" 启用VIM内置的man page reviewer，可以用命令`:Man XXX`查看手册页
runtime! ftplugin/man.vim
" ### }}} VIM 特性配置结束

" ############################################################################ "
" ###############     VIM插件：使用Vundle.vim 管理插件     ################### "
" ############################################################################ "
" {{{ Vundle Setting
" Vundle必须：先关闭兼容模式及文件类型检测
set nocompatible
filetype off

" refer to http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle/
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle必须：让vundle管理插件版本
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
	let g:solarized_termcolors=256
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'tomasr/molokai'
Plugin 'taglist.vim'
"	map <F2> :silent! Tlist<CR>
let Tlist_Ctags_Cmd='/home/chen.yf/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Sort_Type='name'
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_Menu=1
let Tlist_Max_Submenu_Items=10
let Tlist_Max_Tag_length=20
let Tlist_Use_SingleClick=0
let Tlist_Auto_Open=0
let Tlist_Close_On_Select=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=0
let Tlist_Process_File_Always=1
let Tlist_WinHeight=15
let Tlist_WinWidth=28
let Tlist_Use_Horiz_Window=0

	noremap <F8> :TlistToggle<CR>
	let Tlist_Ctags_Cmd='ctags'
	let Tlist_Exit_OnlyWindow=1
	Plugin 'scrooloose/syntastic'
	let g:syntastic_error_symbol='✗'
	let g:syntastic_warning_symbol='⚠'
	let g:syntastic_check_on_open=0
	let g:syntastic_check_on_wq=0
	let g:syntastic_auto_loc_list=0
Plugin 'EasyMotion'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
	set noshowmode
	set laststatus=2
	let g:airline_theme='powerlineish'
	let g:airline_powerline_fonts = 1
	let g:airline_detect_whitespace = 1
"	let g:airline#extensions#tabline#enabled = 1
"	let g:airline#extensions#hunks#non_zero_only = 1
"Plugin 'ctrlp.vim'
	let g:ctrlp_follow_symlinks=1
"	let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'lilydjwg/colorizer'
Plugin 'sheerun/vim-polyglot'

" 安装了Vundle后，首次自动安装插件
if iCanHazVundle == 0
    echo "Installing plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

" 你的所有插件需要在下面这行之前
call vundle#end()
" Vundle必须：加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin indent on
" }}} End of Vundle Setting

" 开启语法高亮显示，终端支持256色。
syntax on
set t_Co=256
" 设置色彩空间为暗色调，使用solarized配色方案
set background=dark
set tags +=/home/yf.chen/tags
"colorscheme desert
colorscheme solarized
