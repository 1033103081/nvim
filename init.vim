"    ____      _ __        _
"   /  _/___  (_) /__   __(_)___ ___
"   / // __ \/ / __/ | / / / __ `__ \
" _/ // / / / / /__| |/ / / / / / / /
"/___/_/ /_/_/\__(_)___/_/_/ /_/ /_/


" General Settings
if !exists('g:vscode')
    source $HOME/.config/nvim/plug-config/polyglot.vim
endif

source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/plug-config/quickscope.vim
"
if exists('g:vscode')
    "" VS Code extension
    source $HOME/.config/nvim/vscode/settings.vim
    source $HOME/.config/nvim/plug-config/easymotion.vim
    source $HOME/.config/nvim/plug-config/highlightyank.vim
else
    "
    " Themes
    source $HOME/.config/nvim/themes/airline.vim
    "" Plugin Configuration
    source $HOME/.config/nvim/keys/which-key.vim
    source $HOME/.config/nvim/plug-config/vim-commentary.vim
    " source $HOME/.config/nvim/plug-config/rainbow.vim
    source $HOME/.config/nvim/plug-config/rnvimr.vim
    source $HOME/.config/nvim/plug-config/better-whitespace.vim
    source $HOME/.config/nvim/plug-config/fzf.vim
    source $HOME/.config/nvim/plug-config/sneak.vim
    source $HOME/.config/nvim/plug-config/codi.vim
    source $HOME/.config/nvim/plug-config/vim-wiki.vim
    source $HOME/.config/nvim/plug-config/goyo.vim
    source $HOME/.config/nvim/plug-config/vim-rooter.vim
    source $HOME/.config/nvim/plug-config/start-screen.vim
    source $HOME/.config/nvim/plug-config/gitgutter.vim
    source $HOME/.config/nvim/plug-config/git-messenger.vim
    source $HOME/.config/nvim/plug-config/closetags.vim
    source $HOME/.config/nvim/plug-config/floaterm.vim
    source $HOME/.config/nvim/plug-config/far.vim
    source $HOME/.config/nvim/plug-config/tagalong.vim
    " source $HOME/.config/nvim/plug-config/illuminate.vim
    source $HOME/.config/nvim/plug-config/bracey.vim
    source $HOME/.config/nvim/plug-config/asynctask.vim
    source $HOME/.config/nvim/plug-config/window-swap.vim
    source $HOME/.config/nvim/plug-config/markdown-preview.vim
    source $HOME/.config/nvim/plug-config/startfy.vim
    source $HOME/.config/nvim/plug-config/nerdtree.vim
    source $HOME/.config/nvim/plug-config/autoformat.vim
    source $HOME/.config/nvim/plug-config/ultisnips.vim
    luafile $HOME/.config/nvim/lua/plug-colorizer.lua
    source $HOME/.config/nvim/plug-config/coc.vim
    " source $HOME/.config/nvim/plug-config/vimspector.vim " Uncomment if you want to use Vimspector
    "source $HOME/.config/nvim/plug-config/ale.vim
endif

let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
    let has_machine_specific_file = 0
    silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
    exec "e ~/.config/nvim/_machine_specific.vim"
endif

source ~/.config/nvim/langtemplate.vim



" Better nav for omnicomplete TODO figure out why this is being overridden
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
