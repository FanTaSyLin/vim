set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"��ɫ����
colorscheme blackboard 

"���ع������Ͳ˵���
set guioptions-=m
set guioptions-=T

"���ù���Ŀ¼Ϊ��ǰ�༭�ļ���Ŀ¼
set bsdir=buffer
set autochdir
"��������
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"��������
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set guifont=Monaco:h9
set gfw=YaHei\ Consolas\ Hybrid:h9

set helplang=cn
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"��ֹ������ʱ�ļ�
set nobackup

"�������Դ�Сд
set ignorecase 

"�������ַ�����
set incsearch
"����ʱ������ʾ���ҵ����ı�
set hlsearch

" �趨 << �� >> �����ƶ�ʱ�Ŀ��Ϊ 4
set shiftwidth=4
set smarttab
set history=1024

"�����滻
set gdefault

"ʼ����ʾ�к�
set number

"��ʾ��������
set ruler

"��������
set cursorline

"�Զ�����
set noautoindent
set cindent
set smartindent

"Tab���Ŀ��
set shiftwidth=4
set tabstop=4

"���뷨����
if has('multi_byte_ime')
	"δ����IMEʱ��걳��ɫ
	hi Cursor guifg=bg guibg=Orange gui=NONE
	"����IMEʱ��걳��ɫ
	hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
	" �ر�Vim���Զ��л�IME���뷨(����ģʽ�ͼ���ģʽ)
	set iminsert=0 imsearch=0
	" ����ģʽ���뷨״̬δ����¼ʱ��Ĭ�Ϲر�IME
	"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"��Windows���������
set clipboard+=unnamed

"�༭vimrc֮�����¼���
autocmd! bufwritepost _vimrc source $VIM/_vimrc

"##########������� ��ʼ#############
"���������� http://vim-scripts.org/vim/scripts.html
filetype on
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')

"���������Ŀ�
Bundle 'gmarik/vundle'

"ʵ��Դ����ṹ�ͺ����б�չʾ
Bundle 'taglist.vim'
map <F3> :silent! Tlist<CR> 

"ʵ��C/C++�����Զ���ȫ
Bundle 'OmniCppComplete'
" build tags of your own project with CTRL+F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"ע�Ͳ��
Bundle 'The-NERD-Commenter'

"��ע�������ĵ��������ܹ��������ɺ�����׼ע��
Bundle 'DoxygenToolkit.vim'
map fg : Dox<cr>
let g:DoxygenToolkit_authorName="Xiaoyang Zhu"
let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30

"ʵ��cpp��h�ļ������л�
Bundle 'a.vim'

"�ļ�������
Bundle 'The-NERD-tree'
" ��Tree���Լ���װ�εö��˶��Ư����
let NERDChristmasTree=1
" ���Ƶ�����ƶ�����һ������ʱ���Ƿ��Զ������������������
let NERDTreeAutoCenter=1
" ָ�����ģʽ(1.˫���� 2.��Ŀ¼˫�ļ� 3.������)
let NERDTreeMouseMode=2
" �Ƿ�Ĭ����ʾ��ǩ�б�
let NERDTreeShowBookmarks=1
" �Ƿ�Ĭ����ʾ�ļ�
let NERDTreeShowFiles=1
" �Ƿ�Ĭ����ʾ�к�
let NERDTreeShowLineNumbers=0
" ����λ�ã�'left' or 'right'��
let NERDTreeWinPos='left'
" ���ڿ��
let NERDTreeWinSize=31
"A-t : ��NERDTree
map <silent> <C-t>   <ESC>:NERDTree<CR>
" �Դ�NERDTreeʱ��Ŀ¼Ϊ����Ŀ¼
let NERDTreeChDirMode=1

"���벹ȫ
Bundle 'Shougo/neocomplcache'
let g:neocomplcache_enable_at_startup = 1 
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

"Bundle "asins/snipmate-snippets"
Bundle "Shougo/neosnippet"
let g:neosnippet#snippets_directory=$VIMFILES.'/bundle/snipmate-snippets/snippets'
" Plugin key-mappings.
imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

Bundle 'honza/snipmate-snippets'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"
"�������ַ����䣬 ��Ҫ�޸�Դ����֧�������ַ� https://github.com/muzuiget/hacking-patches/blob/master/tabular_cjk_width.patch
Bundle 'Tabular'

"statuslines ��ǿ
Bundle 'scrooloose/vim-statline'

"���������ļ����͵�������ϵ
filetype plugin indent on     " required! 
"##########������� ����#############

" tagsĿ¼
set tags+=$VIM/vimfiles/tags/cpp

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" �༭ģʽ���й���ƶ�
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk

"mm : �淶���׿ո�<cr>ȥ�������ַ�<cr>ɾ���հ���<cr>�淶����
nmap mm :%s/\r//g<cr>

"ff : ǰ��ȫ
"vmap ff <Esc>`>i')?><Esc>`<i<?=$this->_('<Esc>
vmap ff "zdi<?=$this->_('<C-R>z');?><ESC>


