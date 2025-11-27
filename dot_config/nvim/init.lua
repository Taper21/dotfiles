--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================

Kickstart.nvim is *not* a distribution.

Kickstart.nvim is a template for your own configuration.
  The goal is that you can read every line of code, top-to-bottom, and understand
  what your configuration is doing.

  Once you've done that, you should start exploring, configuring and tinkering to
  explore Neovim!

--]]

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------------------
-- Plugins
-----------------------------------------------------------------------

require('lazy').setup({
  -- Git
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect indentation
  'tpope/vim-sleuth',

  -------------------------------------------------------------------
  -- LSP
  -------------------------------------------------------------------
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', tag = 'legacy' },
      'folke/neodev.nvim',
    },
  },

  -------------------------------------------------------------------
  -- Autocomplete
  -------------------------------------------------------------------
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  },

  -- Which key
  { 'folke/which-key.nvim', opts = {} },

  -- Git signs
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -------------------------------------------------------------------
  -- THEMES
  -------------------------------------------------------------------
  {
    "ful1e5/onedark.nvim",
    priority = 1000,
    name = "onedark",
  },

  {
    "ghifarit53/tokyonight-vim",
    priority = 1000,
    name = "tokyonight",
  },

  {
    "sainnhe/sonokai",
    priority = 1000,
    name = "sonokai",
  },

  {
    "challenger-deep-theme/vim",
    priority = 1000,
    name = "challenger_deep",
  },

  {
    "tanvirtin/monokai.nvim",
    priority = 1000,
    name = "monokai",
  },

  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({})
      vim.cmd.colorscheme 'catppuccin'
    end,
  },

  -------------------------------------------------------------------
  -- Dashboard
  -------------------------------------------------------------------
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          week_header = { enable = true },
          shortcut = {
            { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope git_files',
              key = 'f',
            },
            {
              icon = '↗ ',
              icon_hl = '@variable',
              desc = 'Branches',
              group = 'GitBranches',
              action = 'Telescope git_branches',
              key = 'b',
            },
            {
              icon = '🔧 ',
              icon_hl = '@variable',
              desc = 'Config',
              group = 'Config',
              action = 'e ~/.config/nvim',
              key = 'c',
            },
            {
              icon = '⛔ ',
              icon_hl = '@variable',
              desc = 'Quit',
              group = 'ExitDashboard',
              action = 'qa',
              key = 'q',
            },
          },
        },
      }
    end
  },

  -------------------------------------------------------------------
  -- Icons (RESTORED – REQUIRED BY MANY PLUGINS)
  -------------------------------------------------------------------
  { "nvim-tree/nvim-web-devicons" },

  -------------------------------------------------------------------
  -- Statusline
  -------------------------------------------------------------------
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { 'numToStr/Comment.nvim', opts = {} },

  -------------------------------------------------------------------
  -- Telescope
  -------------------------------------------------------------------
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function() return vim.fn.executable 'make' == 1 end,
  },

  -------------------------------------------------------------------
  -- Treesitter
  -------------------------------------------------------------------
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  -------------------------------------------------------------------
  -- Tmux navigation
  -------------------------------------------------------------------
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require'nvim-tmux-navigation'.setup {
        disable_when_zoomed = true,
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        }
      }
    end
  },

  -------------------------------------------------------------------
  -- UI & Utils
  -------------------------------------------------------------------
  { 'akinsho/bufferline.nvim', desc = "Bufferline UI", config = function() return require("bufferline").setup() end },
  { 'nvim-tree/nvim-tree.lua', desc = "File Explorer", config = function() return require("nvim-tree").setup() end },
  {
    "dyng/ctrlsf.vim",
    config = function()
      vim.g.ctrlsf_backend = "rg"
    end
  },
  { 'kylechui/nvim-surround', config = function() return require("nvim-surround").setup() end },
  { 'sindrets/diffview.nvim' },
  { 'chrisgrieser/nvim-spider' },
  { 'arthurxavierx/vim-caser' },

  -------------------------------------------------------------------
  -- Formatting (Prettier + Null-ls)
  -------------------------------------------------------------------
  {
    'MunifTanjim/prettier.nvim',
    config = function()
      return require('prettier').setup({
        bin = 'prettier',
        filetypes = {
          "css", "graphql", "html", "javascript", "javascriptreact",
          "json", "less", "markdown", "scss", "typescript",
          "typescriptreact", "yaml",
        },
      })
    end,
    dependencies = {
      'neovim/nvim-lspconfig',
      {
        'nvimtools/none-ls.nvim',
        config = function()
          local null_ls = require("null-ls")

          local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
          local event = "BufWritePre"
          local async = event == "BufWritePost"

          null_ls.setup({
            on_attach = function(client, bufnr)
              if client.supports_method("textDocument/formatting") then
                vim.keymap.set("n", "<Leader>f", function()
                  vim.lsp.buf.format({ bufnr = bufnr })
                end, { buffer = bufnr, desc = "LSP: Format File" })

                vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
                vim.api.nvim_create_autocmd(event, {
                  buffer = bufnr,
                  group = group,
                  callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, async = async })
                  end,
                })
              end
            end,
          })
        end,
      }
    }
  },

  -------------------------------------------------------------------
  -- Custom plugins folder
  -------------------------------------------------------------------
  { import = 'custom.plugins' }
})

-----------------------------------------------------------------------
-- Key mappings (Spider motions)
-----------------------------------------------------------------------
vim.keymap.set({"n", "o", "x"}, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider: Move w" })
vim.keymap.set({"n", "o", "x"}, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider: Move e" })
vim.keymap.set({"n", "o", "x"}, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider: Move b" })
vim.keymap.set({"n", "o", "x"}, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider: Move ge" })

-----------------------------------------------------------------------
-- Options
-----------------------------------------------------------------------
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.opt.termguicolors = true

-- Space disables
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, desc = "Disable Space" })

-- Wrapped movement
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Up (wrapped)" })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Down (wrapped)" })

-----------------------------------------------------------------------
-- Highlight on yank
-----------------------------------------------------------------------
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  group = highlight_group,
  pattern = '*',
})

-----------------------------------------------------------------------
-- Telescope
-----------------------------------------------------------------------
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = "[?] Recently opened files" })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = "[B]uffers" })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(
    require('telescope.themes').get_dropdown { winblend = 10, previewer = false }
  )
end, { desc = "Fuzzy search in current buffer" })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').colorscheme, { desc = "[S]earch [C]olorschemes" })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').git_files, { desc = "[S]earch Git Files" })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = "[S]earch [W]ord under cursor" })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = "[S]earch [D]iagnostics" })

-----------------------------------------------------------------------
-- Treesitter config
-----------------------------------------------------------------------
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust',
    'tsx', 'typescript', 'vimdoc', 'vim', 'sql' },

  auto_install = true,

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },

    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },

    swap = {
      enable = true,
      swap_next = { ['<leader>a'] = '@parameter.inner' },
      swap_previous = { ['<leader>A'] = '@parameter.inner' },
    },
  },
}

-----------------------------------------------------------------------
-- Diagnostics Keymaps
-----------------------------------------------------------------------
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Floating Diagnostic" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Diagnostics to Quickfix" })

-----------------------------------------------------------------------
-- LSP
-----------------------------------------------------------------------
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then desc = 'LSP: ' .. desc end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')

  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Help')

  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format',
    function() vim.lsp.buf.format() end,
    { desc = 'Format current buffer with LSP' }
  )
end

require('neodev').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('mason').setup()

local servers = {
  ts_ls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers)
}

local lspconfig = require("lspconfig")

for _, server_name in ipairs(mason_lspconfig.get_installed_servers()) do
  lspconfig[server_name].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = servers[server_name],
  })
end

-----------------------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------------------
local cmp = require 'cmp'
local luasnip = require 'luasnip'
luasnip.config.setup {}

cmp.setup {
  snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },

  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
      else fallback() end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then luasnip.jump(-1)
      else fallback() end
    end, { 'i', 's' }),
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-----------------------------------------------------------------------
-- Custom keymaps
-----------------------------------------------------------------------
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, { desc = "Search Git Files (<C-p>)" })
vim.keymap.set('n', '<Leader><Leader>', '<C-^>', { desc = "Switch to Alternate File" })
vim.keymap.set('n', '<Leader>j', ':bp<CR>', { desc = "Previous Buffer" })
vim.keymap.set('n', '<Leader>k', ':bn<CR>', { desc = "Next Buffer" })
vim.keymap.set('n', '<Leader>d', ':bd<CR>', { desc = "Delete Buffer" })
vim.keymap.set('n', '<Leader>da', ':%bd|e#|bd#<CR>', { desc = "Delete All Buffers Except Current" })

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = "Toggle File Tree" })
vim.keymap.set('n', '<C-n>n', ':NvimTreeFindFile<CR>', { desc = "Reveal File in Tree" })

vim.keymap.set('n', 'g/', ':CtrlSF ', { desc = "CtrlSF Search" })

-----------------------------------------------------------------------
-- Typescript SQL highlight
-----------------------------------------------------------------------
vim.cmd([[
  au FileType typescript syntax match typescriptSQL /SQL.*/
  syntax region typescriptSQL start=/SQL/ end=/$/
  ]])

