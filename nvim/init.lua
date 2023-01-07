vim.cmd([[
" source $HOME/Documents/Backup/init.vim
source ~/.config/nvim/source/plugins.vim
source ~/.config/nvim/source/init.vim
]])

-- Icones
-- require'nvim-web-devicons'.setup {
--  -- your personnal icons can go here (to override)
--  -- you can specify color or cterm_color instead of specifying both of them
--  -- DevIcon will be appended to `name`
--  -- override = {
--  --  zsh = {
--  --    icon = "",
--  --    color = "#428850",
--  --    cterm_color = "65",
--  --    name = "Zsh"
--   -- }
--  -- };
--  -- globally enable different highlight colors per icon (default to true)
--  -- if set to false all icons will have the default icon's color
--  color_icons = true;
--  -- globally enable default icons (default to false)
--  -- will get overriden by `get_icons` option
--  default = true;
-- }

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
local wk = require("which-key")
-- Put all keymappings here ! 
wk.register({
  ["<leader>f"] = {name = "Telescope"},
  ["<leader>ff"] = { "<cmd>Telescope find_files theme=dropdown<cr>", "Find File" },
  ["<leader>fr"] = { "<cmd>Telescope oldfiles theme=dropdown<cr>", "Open Recent File" },
  ["<leader>fg"] = { "<cmd>Telescope live_grep theme=dropdown<cr>", "Live grep" },
  ["<leader>fb"] = { "<cmd>Telescope buffers theme=dropdown<cr>", "Buffers" },
  ["<leader>fh"] = { "<cmd>Telescope help_tags theme=dropdown<cr>", "Help" },
})

vim.cmd(([[ 
autocmd Filetype markdown lua whichkeyMarkdown()
]]))

_G.whichkeyMarkdown = function()
  local wk = require("which-key")
  local buf = vim.api.nvim_get_current_buf()
wk.register({
  ["<leader>l"] = {name = "Make and view with zathura"},
  ["<leader>ll"] = { "<cmd>Pandoc<CR>", "Build pdf", buffer = buf} ,
  })
end



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

-- lualine
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  }
}

-- Telescope
local builtin = require('telescope.builtin')
require('telescope').setup {
  defaults = {
    color_devicons = false,
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('ultisnips')

-- nvim-cmp 
-- vim.o.completeopt = "menu, menuone,noselect"
---- cmp + UltiSnips
require("cmp_nvim_ultisnips").setup{
  filetype_source = "treesitter",
  show_snippet = "expandable",
  documentation = function(snippet)
    return snippet.description
  end
}

local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
local cmp = require'cmp'
cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(), 
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.complete(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.compose { "expand", "select_next_item" , "jump_forwards" }(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.compose { "select_prev_item" , "jump_backwards" }(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
      },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
})
 
-- Set configuration for specific filetype.
cmp.setup.filetype('tex', {
  sources = cmp.config.sources({
    { name = 'omni' }, -- See vimtex-help
    { name = 'buffer' },
    { name = 'ultisnips' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- HOP
require'hop'.setup()
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 's', function()
  hop.hint_char2()
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})

-- Pandoc
require('pandoc').setup()
