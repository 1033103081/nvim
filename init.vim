" __  ____   __  _   ___	 _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @theniceboy
" Modified by Jack Markrest

if !exists('g:vscode')
	"保存配置时文件自动重新加载
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
	" ===
	" === Auto load for first time uses
	" ===
	"
	if !executable('git')
		echo "Git is not avliable in your os OR isn't in your PATH"
	endif

	if empty(glob('~/.config/nvim/autoload/plug.vim'))
		if !executable('curl')
			echo "curl is not avilable in your os OR isn't in your PATH"
			exit -1
		endif
		silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

	let has_machine_specific_file = 1
	if empty(glob('~/.config/nvim/_machine_specific.vim'))
		let has_machine_specific_file = 0
		silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
	endif
	source ~/.config/nvim/_machine_specific.vim


	" ====================
	" === Editor Setup ===
	" ====================

	" ===
	" === System
	" ===
	"set clipboard=unnamed
	let &t_ut=''
	set autochdir

	set encoding=UTF-8

	" ===
	" === Editor behavior
	" ===
	set number
	set relativenumber
	set cursorline
	set noexpandtab
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
	set autoindent
	set list
	set listchars=tab:\|\ ,trail:▫
	set scrolloff=4
	set ttimeoutlen=0
	set notimeout
	set viewoptions=cursor,folds,slash,unix
	set wrap
	set tw=0
	set indentexpr=
	set foldmethod=indent
	set foldlevel=99
	set foldenable
	set formatoptions-=tc
	set splitright
	set splitbelow
	set noshowmode
	set showcmd
	set wildmenu
	set ignorecase
	set smartcase
	set shortmess+=c
	set completeopt=longest,noinsert,menuone,noselect,preview
	set inccommand=split
	set ttyfast "should make scrolling faster
	set lazyredraw "same as above
	set visualbell
	silent !mkdir -p ~/.config/nvim/tmp/backup
	silent !mkdir -p ~/.config/nvim/tmp/undo
	set backupdir=~/.config/nvim/tmp/backup,.
	set directory=~/.config/nvim/tmp/backup,.
	if has('persistent_undo')
		set undofile
		set undodir=~/.config/nvim/tmp/undo,.
	endif
	set colorcolumn=80
	set updatetime=1000
	set virtualedit=block

	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


	" ===
	" === Terminal Behavior
	" ===
	let g:neoterm_autoscroll = 1

	"
	"打开vim emulated terminal 即进入输入模式
	autocmd TermOpen term://* startinsert
	"Ctrl+N 进入normal模式
	tnoremap <C-N> <C-\><C-N>
	let g:terminal_color_0   = '#000000'
	let g:terminal_color_1   = '#FF5555'
	let g:terminal_color_2   = '#50FA7B'
	let g:terminal_color_3   = '#F1FA8C'
	let g:terminal_color_4   = '#BD93F9'
	let g:terminal_color_5   = '#FF79C6'
	let g:terminal_color_6   = '#8BE9FD'
	let g:terminal_color_7   = '#BFBFBF'
	let g:terminal_color_8   = '#4D4D4D'
	let g:terminal_color_9   = '#FF6E67'
	let g:terminal_color_10  = '#5AF78E'
	let g:terminal_color_11  = '#F4F99D'
	let g:terminal_color_12  = '#CAA9FA'
	let g:terminal_color_13  = '#FF92D0'
	let g:terminal_color_14  = '#9AEDFE'


	" ===
	" === Basic Mappings
	" ===
	" Set <LEADER> as <SPACE>, ; as :
	let mapleader=" "

	" Save & quit
	noremap Q :q<CR>
	noremap S :w<CR>

	" Open the vimrc file anytime
	noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

	" Open Startify App:就是vim 进入现实的app页面
	noremap <LEADER>st :Startify<CR>


	" make Y to copy till the end of the line
	nnoremap Y y$

	" Copy to system clipboard
	vnoremap Y "+y

	" Indentation
	nnoremap < <<
	nnoremap > >>

	" Search
	noremap <LEADER><CR> :nohlsearch<CR>

	" Adjacent duplicate words
	noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

	" Space to Tab
	noremap <LEADER>tt :%s/	/\t/g
	vnoremap <LEADER>tt :s/	/\t/g

	" Folding
	noremap <silent> <LEADER>o za


	" Faster in-line navigation
	noremap W 5w
	noremap B 5b


	" Open up lazygit
	noremap \g :Git
	noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>


	" ===
	" === Insert Mode Cursor Movement
	" ===

	" ===
	" === Window management
	" ===
	" Use <space> + new arrow keys for moving the cursor around windows
	noremap <LEADER>k <C-w>k
	noremap <LEADER>j <C-w>j
	noremap <LEADER>h <C-w>h
	noremap <LEADER>l <C-w>l
	" Disable the default s key
	noremap s :set autochdir<cr> :pwd<cr>

	" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
	" spilt k up
	noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
	" split j below
	noremap sj :set splitbelow<CR>:split<CR>
	noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
	noremap sl :set splitright<CR>:vsplit<CR>

	" Resize splits with arrow keys
	noremap <up> :res +5<CR>
	noremap <down> :res -5<CR>
	noremap <left> :vertical resize-5<CR>
	noremap <right> :vertical resize+5<CR>

	" Place the two screens up and down
	"noremap sh <C-w>t<C-w>K
	" Place the two screens side by side
	noremap sv <C-w>t<C-w>H

	" Rotate screens
	noremap srh <C-w>b<C-w>K
	noremap srv <C-w>b<C-w>H


	" ===
	" === Tab management
	" ===
	" Create a new tab with tu
	noremap tu :tabe<CR>
	" Move around tabs with tn and ti
	noremap th :-tabnext<CR>
	noremap tl :+tabnext<CR>
	" Move the tabs with tmn and tmi
	"noremap tmn :-tabmove<CR>
	"noremap tmi :+tabmove<CR>


	" ===
	" === Command Mode Cursor Movement
	" ===
	cnoremap <C-a> <Home>
	cnoremap <C-e> <End>
	cnoremap <C-p> <Up>
	cnoremap <C-n> <Down>
	cnoremap <C-b> <Left>
	cnoremap <C-f> <Right>
	cnoremap <M-b> <S-Left>
	cnoremap <M-w> <S-Right>


	" ===
	" === Markdown Settings
	" ===
	" Snippets
	"source ~/.config/nvim/md-snippets.vim
	" auto spell
	autocmd BufRead,BufNewFile *.md setlocal spell


	" ===
	" === Other useful stuff
	" ===
	" \p to show the current buffer file path
	nnoremap \p 1<C-G>

	" Move the next character to the end of the line with ctrl+u
	"inoremap <C-u> <ESC>lx$p

	" Opening a terminal window
	noremap <LEADER>/ :set splitbelow<CR>:sp<CR>:terminal <CR>

	" Press space twice to jump to the next '<++>' and edit it
	noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

	" Spelling Check with <space>sc
	noremap <LEADER>sc :set spell!<CR>

	" Press ` to change case (instead of ~)
	noremap ` ~

	noremap <C-c> zz

	" Auto change directory to current dir
	autocmd BufEnter * silent! lcd %:p:h

	" Call figlet
	noremap tx :r !figlet

	noremap <LEADER>- :lN<CR>
	noremap <LEADER>= :lne<CR>

	" Compile function
	" There should be a command called timeout In MacOs X
	" $ brew install coreutils;
	noremap <leader>dd :call CompileRunGcc()<CR>
	func! CompileRunGcc()
		exec "w"
		if &filetype == 'c'
			set autochdir
			exec "!gcc % -o %<"
			exec "!timeout 30  ./%<"
		elseif &filetype == 'cpp'
			set autochdir
			set splitbelow
			exec "!g++ -std=c++11 % -Wall -o %<"
			exec "!timeout 30  ./%<"
		elseif &filetype == 'java'
			exec "!javac -encoding UTF-8 %"
			exec "!time java %<"
		elseif &filetype == 'sh'
			:!time bash %
		elseif &filetype == 'python'
			exec "!time python3 %"
		elseif &filetype == 'html'
			"silent! exec "!chromium % &"
			silent! exec "!/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome % "
		elseif &filetype == 'javascript'
			set autochdir
			exec "!node %"
		elseif &filetype == 'markdown'
			exec "MarkdownPreview"
		elseif &filetype == 'tex'
			silent! exec "VimtexStop"
			silent! exec "VimtexCompile"
		elseif &filetype == 'go'
			set autochdir
			exec "!go run %"
		endif
	endfunc


	" ===
	" === Install Plugins with Vim-Plug
	" ===
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_powerline_fonts=1
	let g:indent_guides_enable_on_vim_startup=1
	let g:indent_guides_start_level=2
	let g:indent_guides_guide_size=1

	call plug#begin('~/.config/nvim/plugged')

	" Pretty Dress
	Plug 'theniceboy/eleline.vim'
	Plug 'vim-airline/vim-airline'
	"Plug 'vim-airline/vim-airline-themes'
	Plug 'ajmwagar/vim-deus'

	" Genreal Highlighter
	Plug 'jaxbot/semantic-highlight.vim'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
	Plug 'nathanaelkane/vim-indent-guides'

	" File navigation
	Plug 'scrooloose/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'airblade/vim-rooter'
	Plug 'junegunn/fzf'
	Plug 'francoiscabrol/ranger.vim'
	Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}


	" Taglist
	Plug 'liuchengxu/vista.vim'
	Plug 'majutsushi/tagbar'
	"
	" Debugger
	Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}


	" Auto Complete
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'wellle/tmux-complete.vim'
	" Snippets
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'

	" Undo Tree
	Plug 'mbbill/undotree'

	" Git
	Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
	Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
	Plug 'tpope/vim-fugitive' " gv dependency
	Plug 'junegunn/gv.vim' " gv (normal) to show git log
	Plug 'airblade/vim-gitgutter'

	" Tex
	Plug 'lervag/vimtex'

	" CSharp
	Plug 'OmniSharp/omnisharp-vim'

	" HTML, CSS, JavaScript, PHP, JSON, etc.
	Plug 'elzr/vim-json'
	Plug 'hail2u/vim-css3-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
	Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
	Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
	Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
	Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
	Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
	Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }

	" Go
	Plug 'fatih/vim-go' " , { 'do': ':GoUpdateBinaries' }

	" Python
	Plug 'tmhedberg/SimpylFold'
	Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
	Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
	"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
	"Plug 'davidhalter/jedi-vim'
	"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
	Plug 'tweekmonster/braceless.vim'

	" Markdown
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
	Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
	Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown'] }
	Plug 'theniceboy/bullets.vim'

	" Editor Enhancement
	Plug 'jiangmiao/auto-pairs'
	Plug 'terryma/vim-multiple-cursors'
	Plug 'scrooloose/nerdcommenter' " in <LEADER>cc to comment current line ,<LEADER>cu to uncomment current line
	Plug 'AndrewRadev/switch.vim' " gs to switch
	Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
	Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
	Plug 'easymotion/vim-easymotion'
	"Plug 'skywind3000/asyncrun.vim'

	" Formatter
	Plug 'Chiel92/vim-autoformat' "\f to autoformat the file
	"For general writing
	Plug 'junegunn/goyo.vim'
	"Plug 'reedes/vim-wordy'
	"Plug 'ron89/thesaurus_query.vim'

	" Bookmarks
	Plug 'kshenoy/vim-signature'
	" Find & Replace
	Plug 'wsdjeg/FlyGrep.vim' " Ctrl+f (normal) to find file content
	Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
	Plug 'osyo-manga/vim-anzu'

	" Documentation
	"Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

	" Mini Vim-APP
	Plug 'mhinz/vim-startify'
	"Plug 'voldikss/vim-floaterm'
	"Plug 'liuchengxu/vim-clap'
	"Plug 'jceb/vim-orgmode'

	" Vim Applications
	"Plug 'itchyny/calendar.vim'


	" Other useful utilities
	"Plug 'tpope/vim-eunuch' " do stuff like :SudoWrite
	Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
	" Dependencies
	Plug 'MarcWeber/vim-addon-mw-utils'
	Plug 'kana/vim-textobj-user'
	Plug 'roxma/nvim-yarp'
	Plug 'rbgrouleff/bclose.vim' " For ranger.vim

	" Other visual enhancement
	"Plug 'ryanoasis/vim-devicons'
	"
	"Plug 'ludovicchabant/vim-gutentags'
	"`:SignifyDiff`，可以左右分屏对比提交前后记录
	"https://www.zhihu.com/question/47691414
	Plug 'mhinz/vim-signify'
	call plug#end()

	let g:deoplete#enable_at_startup = 1
	set tags=./.tags;,.tags


	"最后啰嗦两句，少用 CTRL-] 直接在当前窗口里跳转到定义，多使用 CTRL-W ] 用新窗口打开并查看光标下符号的定义，或者 CTRL-W } 使用 preview 窗口预览光标下符号的定义。
	"
	" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
	"let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

	" 所生成的数据文件的名称
	"let g:gutentags_ctags_tagfile = '.tags'

	" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
	let s:vim_tags = expand('~/.cache/tags')
	"let g:gutentags_cache_dir = s:vim_tags

	"" 配置 ctags 的参数
	"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
	"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
	"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

	" 检测 ~/.cache/tags 不存在就新建
	if !isdirectory(s:vim_tags)
		silent! call mkdir(s:vim_tags, 'p')
	endif




	" experimental
	set lazyredraw
	set regexpengine=1

	set hidden

	" ===
	" === Dress up my vim
	" ===
	set termguicolors	" enable true colors support
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	set background=dark
	"let ayucolor="mirage"
	"let g:oceanic_next_terminal_bold = 1
	"let g:oceanic_next_terminal_italic = 1
	"let g:one_allow_italics = 1


	"color dracula
	"color one
	color deus
	"color gruvbox
	"let ayucolor="light"
	"color ayu
	"set background=light

	hi NonText ctermfg=gray guifg=grey10
	"hi SpecialKey ctermfg=blue guifg=grey70

	" ===================== Start of Plugin Settings =====================

	" ===
	" === NERDTree
	" ===
	noremap tt :NERDTreeToggle<CR>
	noremap <leader>fl :NERDTreeToggle<CR>
	let NERDTreeMapOpenExpl = ""
	let NERDTreeMapUpdir = "N"
	let NERDTreeMapUpdirKeepOpen = "n"
	let NERDTreeMapOpenSplit = ""
	let NERDTreeMapOpenVSplit = "I"
	let NERDTreeMapActivateNode = "i"
	let NERDTreeMapOpenInTab = "o"
	let NERDTreeMapOpenInTabSilent = "O"
	let NERDTreeMapPreview = ""
	let NERDTreeMapCloseDir = ""
	let NERDTreeMapChangeRoot = "l"
	let NERDTreeMapMenu = ","
	let NERDTreeMapToggleHidden = "zh"


	" ==
	" == GitGutter
	" ==
	let g:gitgutter_map_keys = 0
	let g:gitgutter_override_sign_column_highlight = 0
	let g:gitgutter_preview_win_floating = 1
	autocmd BufWritePost * GitGutter
	nnoremap <LEADER>gf :GitGutterFold<CR>
	nnoremap H :GitGutterPreviewHunk<CR>
	nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
	nnoremap <LEADER>g= :GitGutterNextHunk<CR>


	" ==
	" == NERDTree-git
	" ==
	let g:NERDTreeIndicatorMapCustom = {
				\ "Modified"	: "✹",
				\ "Staged"		: "✚",
				\ "Untracked" : "✭",
				\ "Renamed"	 : "➜",
				\ "Unmerged"	: "═",
				\ "Deleted"	 : "✖",
				\ "Dirty"		 : "✗",
				\ "Clean"		 : "✔︎",
				\ "Unknown"	 : "?"
				\ }


	" ===
	" === coc
	" ===
	" fix the most annoying bug that coc has
	"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
	let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint', 'coc-tslint', 'coc-lists', 'coc-git', 'coc-explorer', 'coc-pyright', 'coc-sourcekit', 'coc-translator', 'coc-flutter', 'coc-todolist', 'coc-yaml', 'coc-tasks', 'coc-actions', 'coc-diagnostic']
	" use <tab> for trigger completion and navigate to the next complete item
	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]	=~ '\s'
	endfunction
	inoremap <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()

	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	inoremap <silent><expr> <c-space> coc#refresh()
	inoremap <silent><expr> <c-o> coc#refresh()

	" Open up coc-commands
	nnoremap <c-c> :CocCommand<CR>
	" Text Objects
	xmap kf <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap kf <Plug>(coc-funcobj-i)
	omap af <Plug>(coc-funcobj-a)
	"
	" Useful commands
	nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)
	nmap <leader>rn <Plug>(coc-rename)
	nmap tt :CocCommand explorer<CR>
	" coc-translator
	nmap ts <Plug>(coc-translator-p)
	" Remap for do codeAction of selected region
	function! s:cocActionsOpenFromSelected(type) abort
		execute 'CocCommand actions.open ' . a:type
	endfunction
	xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
	nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
	" coctodolist
	nnoremap <leader>tn :CocCommand todolist.create<CR>
	nnoremap <leader>tl :CocList todolist<CR>
	nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
	" coc-tasks
	noremap <silent> T :CocList tasks<CR>


	" ===
	" === some error checking
	" ===
	" ===
	" === MarkdownPreview
	" ===
	let g:mkdp_auto_start = 0
	let g:mkdp_auto_close = 1
	let g:mkdp_refresh_slow = 0
	let g:mkdp_command_for_global = 0
	let g:mkdp_open_to_the_world = 0
	let g:mkdp_open_ip = ''
	let g:mkdp_echo_preview_url = 0
	let g:mkdp_browserfunc = ''
	let g:mkdp_preview_options = {
				\ 'mkit': {},
				\ 'katex': {},
				\ 'uml': {},
				\ 'maid': {},
				\ 'disable_sync_scroll': 0,
				\ 'sync_scroll_type': 'middle',
				\ 'hide_yaml_meta': 1
				\ }
	let g:mkdp_markdown_css = ''
	let g:mkdp_highlight_css = ''
	let g:mkdp_port = ''
	let g:mkdp_page_title = '「${name}」'

	" ===
	" === vim-table-mode
	" ===
	noremap <LEADER>tm :TableModeToggle<CR>
	"let g:table_mode_disable_mappings = 1
	let g:table_mode_cell_text_object_i_map = 'k<Bar>'


	" ===
	" === FZF
	" ===
	"noremap <C-p> :FZF<CR>
	"noremap <C-p> :Files<CR>
	"noremap <C-f> :Rg<CR>
	"noremap <C-h> :History<CR>
	""noremap <C-t> :BTags<CR>
	"noremap <C-l> :Lines<CR>
	"noremap <C-w> :Buffers<CR>
	"noremap <leader>; :History:<CR>
	let g:fzf_preview_window = 'right:60%'
	let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

	function! s:list_buffers()
		redir => list
		silent ls
		redir END
		return split(list, "\n")
	endfunction

	function! s:delete_buffers(lines)
		execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
	endfunction

	command! BD call fzf#run(fzf#wrap({
				\ 'source': s:list_buffers(),
				\ 'sink*': { lines -> s:delete_buffers(lines) },
				\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
				\ }))

	"noremap <c-d> :BD<CR>

	let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }





	" ===
	" === CTRLP (Dependency for omnisharp)
	" ===
	let g:ctrlp_map = ''
	let g:ctrlp_cmd = 'CtrlP'
	"nnoremap <Leader>sp :CtrlSF<CR>

	" ===
	" === vim-signature
	" ===
	let g:SignatureMap = {
				\ 'Leader':"m",
				\ 'PlaceNextMark':"m,",
				\ 'ToggleMarkAtLine':"m.",
				\ 'PurgeMarksAtLine':"dm",
				\ 'DeleteMark':"",
				\ 'PurgeMarks':"",
				\ 'PurgeMarkers':"",
				\ 'GotoNextLineAlpha':"m<LEADER>",
				\ 'GotoPrevLineAlpha':"",
				\ 'GotoNextSpotAlpha':"m<LEADER>",
				\ 'GotoPrevSpotAlpha':"",
				\ 'GotoNextLineByPos':"",
				\ 'GotoPrevLineByPos':"",
				\ 'GotoNextSpotByPos':"",
				\ 'GotoPrevSpotByPos':"",
				\ 'GotoNextMarker':"",
				\ 'GotoPrevMarker':"",
				\ 'GotoNextMarkerAny':"",
				\ 'GotoPrevMarkerAny':"",
				\ 'ListLocalMarks':"m/",
				\ 'ListLocalMarkers':"m?"
				\ }


	" ===
	" === vim-bookmarks
	" ===
	let g:bookmark_no_default_key_mappings = 1
	nmap mt <Plug>BookmarkToggle
	nmap ma <Plug>BookmarkAnnotate
	nmap ml <Plug>BookmarkShowAll
	nmap mi <Plug>BookmarkNext
	nmap mn <Plug>BookmarkPrev
	nmap mC <Plug>BookmarkClear
	nmap mX <Plug>BookmarkClearAll
	nmap mu <Plug>BookmarkMoveUp
	nmap me <Plug>BookmarkMoveDown
	nmap <Leader>g <Plug>BookmarkMoveToLine
	let g:bookmark_save_per_working_dir = 1
	let g:bookmark_auto_save = 1
	let g:bookmark_highlight_lines = 1
	let g:bookmark_manage_per_buffer = 1
	let g:bookmark_save_per_working_dir = 1
	let g:bookmark_center = 1
	let g:bookmark_auto_close = 1
	let g:bookmark_location_list = 1




	" ===
	" === Undotree
	" ===
	noremap U :UndotreeToggle<CR>
	let g:undotree_DiffAutoOpen = 1
	let g:undotree_SetFocusWhenToggle = 1
	let g:undotree_ShortIndicators = 1
	let g:undotree_WindowLayout = 2
	let g:undotree_DiffpanelHeight = 8
	let g:undotree_SplitWidth = 24
	function g:Undotree_CustomMap()
		nmap <buffer> u <plug>UndotreeNextState
		nmap <buffer> e <plug>UndotreePreviousState
		nmap <buffer> U 5<plug>UndotreeNextState
		nmap <buffer> E 5<plug>UndotreePreviousState
	endfunc

	" ==
	" == vim-multiple-cursor
	"" ==
	let g:multi_cursor_use_default_mapping=0
	let g:multi_cursor_start_word_key = '<c-k>'
	let g:multi_cursor_select_all_word_key = '<a-k>'
	let g:multi_cursor_start_key = 'g<c-k>'
	let g:multi_cursor_select_all_key = 'g<a-k>'
	let g:multi_cursor_next_key = '<c-k>'
	let g:multi_cursor_prev_key = '<c-p>'
	let g:multi_cursor_skip_key = '<C-x>'
	let g:multi_cursor_quit_key = '<Esc>'


	" Startify
	let g:startify_lists = [
				\ { 'type': 'files',		 'header': ['	 MRU']				},
				\ { 'type': 'bookmarks',     'header': ['	 Bookmarks']		},
				\ { 'type': 'commands',		 'header': ['	 Commands']			},
				\ ]


	" ===
	" === Far.vim
	" ===
	noremap <LEADER>f :F  **/*<left><left><left><left><left>
	let g:far#mapping = {
				\ "replace_undo" : ["l"],
				\ }


	" ===
	" === vim-visual-multi
	" ===
	"let g:VM_theme             = 'iceblue'
	"let g:VM_default_mappings = 0
	let g:VM_leader = {'default': ',', 'visual': ',', 'buffer': ','}
	let g:VM_maps = {}
	let g:VM_custom_motions  = {'n': 'n', 'i': 'I', 'u': 'u', 'e': 'e', 'N': 'N', 'I': 'I', 'h': 'h'}
	let g:VM_maps['i']         = 'i'
	let g:VM_maps['I']         = 'I'
	let g:VM_maps['Find Under']         = '<C-k>'
	let g:VM_maps['Find Subword Under'] = '<C-k>'
	let g:VM_maps['Find Next']         = ''
	let g:VM_maps['Find Prev']         = ''
	let g:VM_maps['Remove Region'] = 'q'
	let g:VM_maps['Skip Region'] = '<c-n>'
	let g:VM_maps["Undo"]      = 'u'
	let g:VM_maps["Redo"]      = '<C-r>'






	" ===
	" === Bullets.vim
	" ===
	"let g:bullets_set_mappings = 0
	let g:bullets_enabled_file_types = [
				\ 'markdown',
				\ 'text',
				\ 'gitcommit',
				\ 'scratch'
				\]

	" ===
	" === Vista.vim
	" ===
	noremap <c-t> :silent! Vista finder coc<CR>
	let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
	let g:vista_default_executive = 'ctags'
	let g:vista_fzf_preview = ['right:50%']
	let g:vista#renderer#enable_icon = 1
	let g:vista#renderer#icons = {
				\   "function": "\uf794",
				\   "variable": "\uf71b",
				\  }
	function! NearestMethodOrFunction() abort
		return get(b:, 'vista_nearest_method_or_function', '')
	endfunction
	set statusline+=%{NearestMethodOrFunction()}
	autocmd VimEnter * call vista#RunForNearestMethodOrFunction()



	" ===
	" === Ranger.vim
	" ===
	nnoremap R :Ranger<CR>
	let g:ranger_map_keys = 0


	" ===
	" === fzf-gitignore
	" ===
	noremap <LEADER>gi :FzfGitignore<CR>


	" ===
	" === Ultisnips
	" ===
	let g:tex_flavor = "latex"
	inoremap <c-n> <nop>
	let g:UltiSnipsExpandTrigger="<leader><tab>"
	let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
	let g:UltiSnipsJumpBackwardTrigger="<ctrl-e>"
	let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/Ultisnips/', 'UltiSnips']
	silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>


	" ===
	" === vimtex
	" ===
	"let g:vimtex_view_method = ''
	let g:vimtex_view_general_viewer = 'llpp'
	let g:vimtex_mappings_enabled = 0
	let g:vimtex_text_obj_enabled = 0
	let g:vimtex_motion_enabled = 0
	let maplocalleader=' '


	" ===
	" === FlyGrep
	" ===
	nnoremap <c-f> :FlyGrep<CR>


	" ===
	" === GV
	" ===
	nnoremap gv :GV<CR>


	" ===
	" === Anzu
	" ===
	set statusline=%{anzu#search_status()}
	nnoremap = n
	nnoremap - N


	" ===
	" === vim-go
	" ===
	let g:go_textobj_enabled = 0
	let g:go_auto_type_info = 1
	"let g:go_def_mapping_enabled = 1
	let g:go_highlight_array_whitespace_error	= 1
	let g:go_highlight_build_constraints		 = 1
	let g:go_highlight_chan_whitespace_error	 = 1
	let g:go_highlight_extra_types			   = 1
	let g:go_highlight_fields					= 1
	let g:go_highlight_format_strings			= 1
	let g:go_highlight_function_calls			= 1
	let g:go_highlight_function_parameters	   = 1
	let g:go_highlight_functions				 = 1
	let g:go_highlight_generate_tags			 = 1
	let g:go_highlight_methods				   = 1
	let g:go_highlight_operators				 = 1
	let g:go_highlight_space_tab_error		   = 1
	let g:go_highlight_string_spellcheck		 = 1
	let g:go_highlight_structs				   = 1
	let g:go_highlight_trailing_whitespace_error = 1
	let g:go_highlight_types					 = 1
	let g:go_highlight_variable_assignments	  = 0
	let g:go_highlight_variable_declarations	 = 0


	" ===
	" === AutoFormat
	" ===
	nnoremap \f :Autoformat<CR>

	" ===
	" === OmniSharp
	" ===
	let g:OmniSharp_typeLookupInPreview = 1
	let g:omnicomplete_fetch_full_documentation = 1

	let g:OmniSharp_server_use_mono = 1
	let g:OmniSharp_server_stdio = 1
	let g:OmniSharp_highlight_types = 2
	let g:OmniSharp_selector_ui = 'ctrlp'

	autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
	autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
	autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
	autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
	autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>

	sign define OmniSharpCodeActions text=💡

	augroup OSCountCodeActions
		autocmd!
		autocmd FileType cs set signcolumn=yes
		autocmd CursorHold *.cs call OSCountCodeActions()
	augroup END

	function! OSCountCodeActions() abort
		if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
		if !OmniSharp#IsServerRunning() | return | endif
		let opts = {
					\ 'CallbackCount': function('s:CBReturnCount'),
					\ 'CallbackCleanup': {-> execute('sign unplace 99')}
					\}
		call OmniSharp#CountCodeActions(opts)
	endfunction

	function! s:CBReturnCount(count) abort
		if a:count
			let l = getpos('.')[1]
			let f = expand('%:p')
			execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
		endif
	endfunction



	" ===
	" === Colorizer
	" ===
	let g:colorizer_syntax = 1


	" ===
	" === vim-easymotion
	" ===
	let g:EasyMotion_smartcase = 1
	let g:EasyMotion_do_shade = 0
	let g:EasyMotion_smartcase = 1
	" 'f{char} to move to {char}
	map f <Plug>(easymotion-bd-f)
	nmap f <Plug>(easymotion-overwin-f)



	" ===================== End of Plugin Settings =====================

	" ===
	" === Necessary Commands to Execute
	" ===
	exec "nohlsearch"

	" Open the _machine_specific.vim file if it has just been created
	if has_machine_specific_file == 0
		exec "e ~/.config/nvim/_machine_specific.vim"
	endif

	source ~/.config/nvim/langtemplate.vim

else
	"noremap sh :split<cr>

	function! s:split(...) abort
		let direction = a:1
		let file = a:2
		call VSCodeCall(direction == 'h' ? 'workbench.action.splitEditorDown' : 'workbench.action.splitEditorRight')
		if file != ''
			call VSCodeExtensionNotify('open-file', expand(file), 'all')
		endif
	endfunction

	function! s:splitNew(...)
		let file = a:2
		call s:split(a:1, file == '' ? '__vscode_new__' : file)
	endfunction

	function! s:closeOtherEditors()
		call VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
		call VSCodeNotify('workbench.action.closeOtherEditors')
	endfunction

	function! s:manageEditorSize(...)
		let count = a:1
		let to = a:2
		for i in range(1, count ? count : 1)
			call VSCodeNotify(to == 'increase' ? 'workbench.action.increaseViewSize' : 'workbench.action.decreaseViewSize')
		endfor
	endfunction

	command! -complete=file -nargs=? Split call <SID>split('h', <q-args>)
	command! -complete=file -nargs=? Vsplit call <SID>split('v', <q-args>)
	command! -complete=file -nargs=? New call <SID>split('h', '__vscode_new__')
	command! -complete=file -nargs=? Vnew call <SID>split('v', '__vscode_new__')
	command! -bang Only if <q-bang> == '!' | call <SID>closeOtherEditors() | else | call VSCodeNotify('workbench.action.joinAllGroups') | endif

	AlterCommand sp[lit] Split
	AlterCommand vs[plit] Vsplit
	AlterCommand new New
	AlterCommand vne[w] Vnew
	AlterCommand on[ly] Only

	nnoremap <silent> <C-w>s :<C-u>call <SID>split('h')<CR>
	xnoremap <silent> <C-w>s :<C-u>call <SID>split('h')<CR>

	nnoremap <silent> <C-w>v :<C-u>call <SID>split('v')<CR>
	xnoremap <silent> <C-w>v :<C-u>call <SID>split('v')<CR>

	nnoremap <silent> <C-w>n :<C-u>call <SID>splitNew('h', '__vscode_new__')<CR>
	xnoremap <silent> <C-w>n :<C-u>call <SID>splitNew('h', '__vscode_new__')<CR>

	nnoremap <silent> <C-w>q :<C-u>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
	xnoremap <silent> <C-w>q :<C-u>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
	nnoremap <silent> <C-w>c :<C-u>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
	xnoremap <silent> <C-w>c :<C-u>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>

	nnoremap <silent> <C-w>o :<C-u>call VSCodeNotify('workbench.action.joinAllGroups')<CR>
	xnoremap <silent> <C-w>o :<C-u>call VSCodeNotify('workbench.action.joinAllGroups')<CR>

	nnoremap <silent> <C-w>j :<C-u>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
	xnoremap <silent> <C-w>j :<C-u>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
	nnoremap <silent> <C-w><C-j> :<C-u>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>
	xnoremap <silent> <C-w><C-j> :<C-u>call VSCodeNotify('workbench.action.moveEditorToBelowGroup')<CR>
	nnoremap <silent> <C-w>k :<C-u>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
	xnoremap <silent> <C-w>k :<C-u>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
	nnoremap <silent> <C-w><C-i> :<C-u>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>
	xnoremap <silent> <C-w><C-i> :<C-u>call VSCodeNotify('workbench.action.moveEditorToAboveGroup')<CR>
	nnoremap <silent> <C-w>h :<C-u>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
	xnoremap <silent> <C-w>h :<C-u>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
	nnoremap <silent> <C-w><C-h> :<C-u>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>
	xnoremap <silent> <C-w><C-h> :<C-u>call VSCodeNotify('workbench.action.moveEditorToLeftGroup')<CR>
	nnoremap <silent> <C-w>l :<C-u>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
	xnoremap <silent> <C-w>l :<C-u>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
	nnoremap <silent> <C-w><C-l> :<C-u>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>
	xnoremap <silent> <C-w><C-l> :<C-u>call VSCodeNotify('workbench.action.moveEditorToRightGroup')<CR>
	nnoremap <silent> <C-w>w :<C-u>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
	nnoremap <silent> <C-w>w :<C-u>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
	xnoremap <silent> <C-w><C-w> :<C-u>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
	xnoremap <silent> <C-w><C-w> :<C-u>call VSCodeNotify('workbench.action.focusNextGroup')<CR>
	nnoremap <silent> <C-w>W :<C-u>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
	xnoremap <silent> <C-w>W :<C-u>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
	nnoremap <silent> <C-w>p :<C-u>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
	xnoremap <silent> <C-w>p :<C-u>call VSCodeNotify('workbench.action.focusPreviousGroup')<CR>
	nnoremap <silent> <C-w>t :<C-u>call VSCodeNotify('workbench.action.focusFirstEditorGroup')<CR>
	xnoremap <silent> <C-w>t :<C-u>call VSCodeNotify('workbench.action.focusFirstEditorGroup')<CR>
	nnoremap <silent> <C-w>b :<C-u>call VSCodeNotify('workbench.action.focusLastEditorGroup')<CR>
	xnoremap <silent> <C-w>b :<C-u>call VSCodeNotify('workbench.action.focusLastEditorGroup')<CR>

	nnoremap <silent> <C-w>= :<C-u>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>
	xnoremap <silent> <C-w>= :<C-u>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>

	nnoremap <silent> <C-w>> :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
	xnoremap <silent> <C-w>> :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
	nnoremap <silent> <C-w>+ :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
	xnoremap <silent> <C-w>+ :<C-u>call <SID>manageEditorSize(v:count, 'increase')<CR>
	nnoremap <silent> <C-w>< :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>
	xnoremap <silent> <C-w>< :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>
	nnoremap <silent> <C-w>- :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>
	xnoremap <silent> <C-w>- :<C-u>call <SID>manageEditorSize(v:count, 'decrease')<CR>

	nnoremap <silent> <C-w>_ :<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

	nnoremap <C-w>H :<C-u>echoerr 'Not supported yet'<CR>
	xnoremap <C-w>H :<C-u>echoerr 'Not supported yet'<CR>
	nnoremap <C-w>L :<C-u>echoerr 'Not supported yet'<CR>
	xnoremap <C-w>L :<C-u>echoerr 'Not supported yet'<CR>
	nnoremap <C-w>K :<C-u>echoerr 'Not supported yet'<CR>
	xnoremap <C-w>K :<C-u>echoerr 'Not supported yet'<CR>
	nnoremap <C-w>J :<C-u>echoerr 'Not supported yet'<CR>
	xnoremap <C-w>J :<C-u>echoerr 'Not supported yet'<CR>
endif
