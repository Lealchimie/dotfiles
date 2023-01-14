"Plug gestion packages
call plug#begin()
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
" Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'vifm/vifm'
" Plug 'vifm/vifm.vim' "deprecated
" Plug 'ervandew/supertab' "Ne marche pas avec UltiSnips
" Plug 'ycm-core/YouCompleteMe'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'jiangmiao/auto-pairs'
" Plug 'itchyny/calendar.vim'
Plug 'mhinz/vim-startify'
" Plug 'justinmk/vim-sneak'
Plug 'phaazon/hop.nvim'
Plug 'jakewvincent/mkdnflow.nvim'
" Plug 'neovimhaskell/haskell-vim'
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'vimwiki/vimwiki'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf'
Plug 'folke/which-key.nvim'
Plug 'ap/vim-css-color'
Plug 'nvim-lua/plenary.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'fhill2/telescope-ultisnips.nvim' 
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
" Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'smjonas/snippet-converter.nvim'
Plug 'williamboman/mason.nvim' " LSP package manager
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-omni'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'aspeddro/pandoc.nvim'
Plug 'folke/tokyonight.nvim'
" Plug 'ixru/nvim-markdown'
call plug#end()
