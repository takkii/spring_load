" Terminal Settings
command! -nargs=* TES split | wincmd j | resize 20 | terminal <args>

" Open Terminal in insert mode
autocmd TermOpen * :startinsert

" Terminal Mode to nonumber
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen * setlocal nonumber

" using vim-plug.
if filereadable(expand('~/.neovim/plugged/neoruby-debugger/plugins/command.vim'))
  source ~/.neovim/plugged/neoruby-debugger/plugins/command.vim
endif

" using NERDTree
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
nnoremap <C-t> :NERDTreeToggle<CR>

" Debug Python Keymap
nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

" Menu Settings
set completeopt+=menuone

" Appearance
let g:lightline = {
  \ 'colorscheme': 'icebergDark',
  \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ],
      \             [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ],
  \ },
\ }

let g:lightline.component_expand = {
  \  'linter_checking': 'lightline#ale#checking',
  \  'linter_warnings': 'lightline#ale#warnings',
  \  'linter_errors': 'lightline#ale#errors',
  \  'linter_ok': 'lightline#ale#ok',
\ }
let g:lightline.component_type = {
  \     'linter_checking': 'left',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'left',
\ }

let b:ale_linters = {
  \   'javascript': ['eslint', 'eslint-plugin-vue'],
  \   'python': ['pyflakes', 'pep8'],
  \   'ruby': ['rubocop'],
  \   'tex': ['textlint'],
  \   'markdown': ['textlint'],
  \   'css': ['stylelint'],
\}

let g:ale_statusline_format = ['E%d', 'W%d', 'ok']
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
nmap <silent> <C-n> <Plug>(ale_next_wrap)

function s:MoveToFileAtStart()
  call feedkeys("\<Space>")
  call feedkeys("\s")
  call feedkeys("\l")
endfunction

cd ~/