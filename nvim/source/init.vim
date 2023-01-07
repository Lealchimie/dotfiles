set nocompatible
"leader : \ (alt + shift + / ) déjà localleader

" General
colorscheme gruvbox
set scrolloff=12
syntax on
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
" xmap ga <Plug>(EasyAlign)

	" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

"____ NerdTree
" nnoremap <leader>b :NERDTreeFocus<CR>

" Lightline
" set laststatus=2
" set noshowmode
" let g:lightline = {
      " \ 'colorscheme': 'jellybeans',
      " \ }

" Surround, sandwich, autopairs 
let g:AutoPairsFlyMode = 0
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
runtime macros/sandwich/keymap/surround.vim " Utiliser les raccourcis surround"

" Sneak
" let g:sneak#label = 0
" map f <Plug>Sneak_s
" map F <Plug>Sneak_S

" VIMTEX"
let g:vimtex_fold_enabled = 0
let g:vimtex_view_method = 'zathura' 
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_format_enabled = 0
let g:vimtex_ident_enabled = 0
let g:vimtex_view_automatic = 1
let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'
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
filetype off
set runtimepath+=/usr/local/share/lilypond/2.22.2/vim/
filetype on
syntax on
augroup lilypond
    autocmd!
    autocmd Filetype lilypond setlocal commentstring=%%s
    autocmd Filetype lilypond set tabstop=2
    autocmd Filetype lilypond set shiftwidth=2
    autocmd Filetype lilypond set foldmethod=syntax
    autocmd Filetype lilypond set expandtab
    " autocmd Filetype lilypond set makeprg=silent! lilypond\ %
    autocmd Filetype lilypond :nnoremap <buffer> <leader>ll :write<CR> :silent make<CR> :silent execute '!zathura %:p:r' . ".pdf "<CR> :redraw!<CR>
    autocmd BufWritePost *.ly :silent! make
augroup END

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
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown set cursorline
autocmd FileType markdown set conceallevel=2
" autocmd FileType markdown set makeprg=silent! pandoc -f markdown -t pdf % %r.pdf " ça ne marche pas 
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

"Macros perso
"map <F2> :w<CR>:!pdflatex %<CR><CR>
" nmap <tab> /<++><CR>cf>
"imap ECC \[\xymatrix{<++> \ar[r]^{<++>} \ar[d]_{<++>} & <++> \ar[d]^{<++>} \\ {<++>} \ar[r]_{<++>} & {<++>} }\]<++><Esc>5h%/<++><CR>cf>
"
nnoremap <esc> :noh<return><esc>
" ctrl + j/k pour naviguer parmis les autosuggestions (coc.nvim) 
nnoremap j gj
nnoremap k gk
