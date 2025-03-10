" ddc.vim
call plug#('Shougo/ddc.vim')
call plug#('Shougo/ddc-converter_remove_overlap')
call plug#('Shougo/ddc-matcher_head')
call plug#('Shougo/ddc-sorter_rank')
call plug#('Shougo/pum.vim')
call plug#('Shougo/ddc-around')
call plug#('Shougo/ddc-source-around')
call plug#('Shougo/ddc-source-lsp')
call plug#('Shougo/ddc-ui-native')
call plug#('vim-denops/denops.vim')
call plug#('LumaKernel/ddc-file')
call plug#('neovim/nvim-lspconfig')
call plug#('uga-rosa/ddc-nvim-lsp-setup')
call plug#('matsui54/ddc-source-dictionary')

" dictionary path
setlocal dictionary+=~/.neovim/plugged/ruby-dict/autoload/source/ruby_method.txt

" You must set the default ui.
call ddc#custom#patch_global('ui', 'native')

call ddc#custom#patch_global('sources', [
 \ 'around',
 \ 'file',
 \ 'lsp',
 \ 'dictionary'
 \ ])

call ddc#custom#patch_global('sourceParams', #{
      \   lsp: #{
      \     snippetEngine: denops#callback#register({
      \           body -> vsnip#anonymous(body)
      \     }),
      \     enableResolveItem: v:true,
      \     enableAdditionalTextEdit: v:true,
      \   },
      \   dictionary: #{
      \     dictPaths: [$HOME . '/.neovim/plugged/ruby-dict/autoload/source/ruby_method.txt'],
      \     showMenu: v:false,
      \     smartCase: v:true,
      \     isVolatile: v:true,
      \   }
      \ })

call ddc#custom#patch_global(#{
      \ sourceOptions: #{
      \ _: #{
      \   matchers: ['matcher_head'],
      \   sorters: ['sorter_rank'],
      \   converters: ['converter_remove_overlap'],	
      \ },
      \ dictionary: #{
      \   mark: '[Dictionary]',
      \ },
      \ around: #{
      \   mark: '[Spring_load]',
      \ },
      \ file: #{
      \   mark: 'file',
      \   isVolatile: v:true,
      \   forceCompletionPattern: '\S/\S*',
      \ },
      \ lsp: #{
      \   mark: '[LSP]',
      \   forceCompletionPattern: '\.\w*|:\w*|->\w*',
      \ },
      \},
      \ sourceParams: #{
      \   lsp: #{
      \     snippetEngine: denops#callback#register({
      \           body -> vsnip#anonymous(body)
      \     }),
      \     enableResolveItem: v:true,
      \     enableAdditionalTextEdit: v:true,
      \     confirmBehavior: 'replace',
      \     isVolatile: v:true,
      \     forceCompletionPattern: '\S/\S*',
      \   }
      \ },
      \})

call ddc#enable()
inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>