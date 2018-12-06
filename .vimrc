"=================================================================
"Vim配置
"================================================================
set clipboard+=unnamed
filetype on
filetype plugin on
filetype indent on
syntax on
set ruler
"set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key
set report=0
autocmd InsertLeave * se nocul
set showmatch
set cursorline
set incsearch
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nu
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! ./%<"
endfunc
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
endfunc
"==================================================================
"vim-gutentags 配置
"==================================================================

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"==================================================================
"Asyncrun 配置
"==================================================================
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>


"==================================================================
"Ale 配置
"==================================================================

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
"===================================================================
"YCM配置
"===================================================================
let g:ycm_auto_trigger = 1 
        " for ycm
        let g:ycm_error_symbol = '>>'
        let g:ycm_warning_symbol = '>*'
        let g:ycm_autoclose_preview_window_after_completion = 1 
        let g:ycm_autoclose_preview_window_after_insertion = 1 
        let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
        nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
        nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
        nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
        nnoremap <F4> :YcmDiags<CR>                                                                                                                                                                                                                            
        inoremap <c-o> <c-x><c-o>
        let g:ycm_semantic_triggers = { 
        \     'c' : ['->', '  ', '.', ' ', '(', '[', '&'],
        \     'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
        \     'perl' : ['->', '::', ' '],
        \     'php' : ['->', '::', '.'],
        \     'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
        \     'ruby' : ['.', '::'],
        \     'lua' : ['.', ':']
        \ }

"===================================================================
"Taglist配置
"==================================================================
let Tlist_Show_One_File=1
let Tlist_Auto_Open=1
let Tlist_Exit_OnlyWindow=1
"===================================================================
"Vim-Plug  配置
"===================================================================
call plug#begin('~/.vim/plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/winmanager'
Plug 'vim-scripts/taglist.vim'
Plug 'quickfix/quickfix'
" Initialize plugin system
call plug#end()
