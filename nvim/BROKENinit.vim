set nocompatible

"Plug gestion packages
call plug#begin()
"Plug 'gerw/vim-latex-suite'
" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
" Plug 'preservim/nerdtree'
" Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
" Plug 'plasticboy/vim-markdown'
" Plug 'franbach/miramare'
" Plug 'ixru/nvim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'vifm/vifm'
" Plug 'vifm/vifm.vim' "deprecated
" Plug 'ervandew/supertab' "Ne marche pas avec UltiSnips
" Plug 'ycm-core/YouCompleteMe'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'jiangmiao/auto-pairs'
" Plug 'itchyny/calendar.vim'
Plug 'mhinz/vim-startify'
Plug 'justinmk/vim-sneak'
" Plug 'jakewvincent/mkdnflow.nvim'
" Plug 'neovimhaskell/haskell-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vimwiki/vimwiki'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'folke/which-key.nvim'
Plug 'ap/vim-css-color'
Plug 'williamboman/mason.nvim' " LSP package manager
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-omni'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" Plug 'L3MON4D3/LuaSnip'
call plug#end()

"leader : \ (alt + shift + / ) déjà localleader

" General
colorscheme gruvbox
set scrolloff=12
set mouse=
" syntax on
set background=dark 
highlight Comment cterm=italic
" hi! Normal ctermbg=NONE guibg=NONE 
" hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 
filetype plugin on
filetype indent off
set number
set relativenumber
set textwidth=80
set wildmenu
set spelllang=fr
" set spell


" Easy align 
	" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

	" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

"____ NerdTree
" nnoremap <leader>b :NERDTreeFocus<CR>

" Lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }
"
" Surround, sandwich, autopairs 
let g:AutoPairsFlyMode = 0
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
runtime macros/sandwich/keymap/surround.vim " Utiliser les raccourcis surround"

" Sneak
let g:sneak#label = 0
map f <Plug>Sneak_s
map F <Plug>Sneak_S

" VIMTEX"
let g:vimtex_fold_enabled = 0
let g:vimtex_view_method = 'zathura' 
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_format_enabled = 0
let g:vimtex_ident_enabled = 0
let g:vimtex_view_automatic = 1
let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_zathura_check_libsynctex = 1
let g:vimtex_quickfix_ignore_filters = [
      \ 'hyperref Warning',
      \]

	"" backward search (usr nvr --servername `cat /tmp/curnvimserver.txt` +"%line" "%file")
function! SetServerName()
  if has('win32')
    let nvim_server_file = $TEMP . "/curnvimserver.txt"
  else
    let nvim_server_file = "/tmp/curnvimserver.txt"
  endif
  let cmd = printf("echo %s > %s", v:servername, nvim_server_file)
  call system(cmd)
endfunction

augroup vimtex_common
    autocmd!
    autocmd FileType tex call SetServerName()
augroup END

" Lilypond
" filetype off
" set runtimepath+=/usr/local/share/lilypond/2.22.2/vim/
" filetype on
" syntax on
" augroup lilypond
"     autocmd!
"     autocmd Filetype lilypond setlocal commentstring=%%s
"     autocmd Filetype lilypond set tabstop=2
"     autocmd Filetype lilypond set shiftwidth=2
"     autocmd Filetype lilypond set foldmethod=syntax
"     autocmd Filetype lilypond set expandtab
    " autocmd Filetype lilypond set makeprg=silent! lilypond\ %
    " autocmd Filetype lilypond :nnoremap <buffer> <leader>ll :write<CR> :silent make<CR> :silent execute '!zathura %:p:r' . ".pdf "<CR> :redraw!<CR>
    " autocmd BufWritePost *.ly :silent! make
" augroup END

"
" UltiSnips
" let g:UltiSnipsExpandTrigger = '<tab>'
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" let g:UltiSnipsEditSplit = 'vertical'

" Mail
autocmd Filetype mail set textwidth=0
autocmd FileType mail set cursorline

" Markdown
let g:vimwiki_global_ext = 0 "So that vimwiki doesn't set filetype on markdown files
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown set cursorline
autocmd FileType markdown set conceallevel=2
" autocmd FileType markdown Goyo
" let g:vim_markdown_folding_style_pythonic = 1
" let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_conceal = 2
" let g:vim_markdown_math = 1
" let g:vim_markdown_toml_frontmatter = 1
" let g:vim_markdown_follow_anchor = 1
" let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"
"____ Preview with Markdown-preview______________
function! g:Open_browser(url)
    " One of the following two lines:
    silent exec '!Chromium --app=' . a:url
    " silent exe 'silent !open -a "Chromium --app=" ' . a:url
endfunction
let g:mkdp_browserfunc = 'g:Open_browser'
let g:mkdp_refresh_slow = 0
let g:mkdp_browser=''
autocmd FileType markdown :nnoremap <leader>ll :write <CR> :silent execute '!zathura %:p:r'

set completeopt=menu,menuone,noselect "" for completion with nvim-cmp

" LUA "

lua << EOF

-- Which key

  require("which-key").setup {
plugins = {
  marks = true, -- shows a list of your marks on ' and `
  registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
  spelling = {
    enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
    suggestions = 20, -- how many suggestions should be shown in the list?
  },
presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
},

  }
}

-- Treesitter

require("nvim-treesitter.install").prefer_git = true -- see https://github.com/nvim-treesitter/nvim-treesitter/issues/3232
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {"markdown", "c"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {"latex"},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {'latex'},
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
-- luasnip & cmp (https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip)

-- local has_words_before = function()
--  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

-- Ultisnips & cmp 
-- Set up nvim-cmp.
-- local luasnip = require("luasnip")
-- require("luasnip.loaders.from_snipmate").lazy_load()

-- MASON 
require("mason").setup()
require("mason-lspconfig").setup()
-- Set up lspconfig.
 local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['texlab'].setup {
   capabilities = capabilities,
   setting = { 
     formatterLineLength = 30,
     latexindent = {
       modifyLineBreaks = false
     },
   },
}


EOF
"
"
"Macros perso
"map <F2> :w<CR>:!pdflatex %<CR><CR>
" nmap <tab> /<++><CR>cf>
"imap ECC \[\xymatrix{<++> \ar[r]^{<++>} \ar[d]_{<++>} & <++> \ar[d]^{<++>} \\ {<++>} \ar[r]_{<++>} & {<++>} }\]<++><Esc>5h%/<++><CR>cf>
"
nnoremap <esc> :noh<return><esc>
" ctrl + j/k pour naviguer parmis les autosuggestions (coc.nvim) 
" inoremap <C-j> <C-n>
" inoremap <C-k> <C-p>
nnoremap j gj
nnoremap k gk
