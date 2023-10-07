" dein.vimの自動インストール
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

" leaderコマンドをスペースに
let mapleader="\<Space>"
" 'nocompatible'を設定して、元のviエディタとの互換性を無効にします
set nocompatible

set background=dark

set backspace=indent,eol,start

" 行番号を表示します
set number

" 現在のコマンドをボトムバーに表示します
set title

" 新しい行を現在の行に合わせてインデントします
set autoindent

" タブが取るスクリーンスペースの数を設定します
set tabstop=2
set shiftwidth=2

" タブをスペースに変換します
set expandtab

" 全てのベル通知をオフにします
set belloff=all

"コマンドラインの高さ
set cmdheight=3

"set clipboard=unnamedplus " macのvimだと使えない
set clipboard=unnamed
" dein.vimをランタイムパスに追加します
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" deinがロードされているかチェックします
if dein#load_state('~/.cache/dein')
  " deinでプラグイン管理を開始します
  call dein#begin('~/.cache/dein')
  " deinでdeinを管理します
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " プラグインを追加します
  call dein#add('scrooloose/nerdtree')    " ファイルエクスプローラプラグイン
  call dein#add('cocopon/iceberg.vim') " カラースキームプラグイン
  call dein#add('folke/tokyonight.nvim') " カラースキームプラグイン
  call dein#add('sainnhe/everforest') " カラースキームプラグイン
  call dein#add('shaunsingh/nord.nvim') " カラースキームプラグイン
  call dein#add('tpope/vim-fugitive') " Gitプラグイン
  call dein#add('preservim/nerdcommenter') " コードのコメントとアンコメントを簡単に行う
  call dein#add('simeji/winresizer') " vimウインドウサイズ制御、Ctrl-Eでリサイズモード、hjklでウインドウサイズ変更
  call dein#add('dense-analysis/ale') " lint
  call dein#add('Yggdroot/indentLine') " インデントガイド
  call dein#add('nvim-lua/plenary.nvim') " ファイル検索、文字列検索
  call dein#add('nvim-telescope/telescope.nvim', { 'rev': '0.1.3' })

    " deinでプラグイン管理を終了します
  call dein#end()

  " 現在のプラグイン状態を保存します
  call dein#save_state()
endif

" ファイルタイプの検出を有効にし、適切なプラグインとインデントをロードします
filetype plugin indent on

" シンタックスハイライトをオンにします
syntax on

" インストールすべきプラグインがあるかチェックし、それらをインストールします
if dein#check_install()
  call dein#install()
endif

" カラースキームを設定します
"colorscheme iceberg
    
" Vimが使用できる色の数を設定します
set t_Co=256

" カーソルラインを強調表示します
set cursorline

" 行末のホワイトスペースを強調表示します
match ErrorMsg '\s\+$'

" ステータスラインを常に表示します
set laststatus=2

" ステータスラインに詳細情報を表示します
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime('%c')}

" 検索時に大文字小文字を無視します（大文字を含む検索語では大文字小文字を区別します）
set ignorecase smartcase

" Insertモードでjjを押すとNomalモードに移行
inoremap jj <Esc>

"keymap 定義
nnoremap <leader>n :NERDTreeToggle<CR>

nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-g> <cmd>Telescope live_grep<cr>

nnoremap <leader>cc :NERDCommenterComment<CR>
nnoremap <leader>cu :NERDCommenterUncomment<CR>

let g:ale_fixers = {
    \   'javascript': ['prettier'],
    \   'html':['prettier'],
    \   'css':['prettier'],
    \   'markdown':['prettier'],
    \}

let g:ale_linters = {
    \   'javascript': ['eslint'],
    \   'html':['htmlhint'],
    \   'css':['stylehint'],
    \}
let g:ale_fix_on_save = 1

let g:indent_guides_enable_on_vim_startup = 1

let g:ctrlp_custom_ignore = "node_modules\|DS_Store\|.git"
