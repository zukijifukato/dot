return ({
  "nvim-lua/plenary.nvim",

  "zukijifukato/neon.nvim",
  "folke/tokyonight.nvim",

  {
    "folke/which-key.nvim",
    config = function()
      require "plugins.config.whichkey"
    end,
  },

  --{
  --  "folke/noice.nvim",
  --  config = function()
  --    require("noice").setup {
  --      lsp = {
  --        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --        override = {
  --          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --          ["vim.lsp.util.stylize_markdown"] = true,
  --          ["cmp.entry.get_documentation"] = true,
  --        },
  --      },
  --      -- you can enable a preset for easier configuration
  --      presets = {
  --        bottom_search = true, -- use a classic bottom cmdline for search
  --        command_palette = false, -- position the cmdline and popupmenu together
  --        long_message_to_split = true, -- long messages will be sent to a split
  --        inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --        lsp_doc_border = false, -- add a border to hover docs and signature help
  --      },
  --    }
  --  end,
  --  dependencies = {
  --    "MunifTanjim/nui.nvim",
  --    "rcarriga/nvim-notify",
  --  },
  --},
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "plugins.config.lualine"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require "plugins.config.tree"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/playground", "mrjones2014/nvim-ts-rainbow" },
    config = function()
      require "plugins.config.treesitter"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "plugins.config.telescope"
    end,
  },

  {
    "theprimeagen/harpoon",
    config = function()
      require "plugins.config.harpoon"
    end,
  },

  {
    "neovim/nvim-lspconfig"
  },
  --{
  --  "williamboman/mason.nvim",
  --  dependencies = { "neovim/nvim-lspconfig", "williamboman/mason-lspconfig.nvim" },
  --  config = function()
  --    require "plugins.config.lsp"
  --  end,
  --},

  {
    "akinsho/flutter-tools.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("plugins.config.fluttertools")
    end
  },

  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({
        server = {
          standalone = true
        }
      })
    end
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "plugins.config.nullls"
    end,
  },

  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "saadparwaiz1/cmp_luasnip",
  "L3MON4D3/LuaSnip",
  "mlaursen/vim-react-snippets",

  --"tpope/vim-fugitive",
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      vim.o.termguicolors = true
      require("colorizer").setup({})
    end
  },
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    config = function ()
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require "plugins.config.autopairs"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        --show_current_context = true,
        --show_current_context_start = true,
      }
    end,
  },

  "folke/zen-mode.nvim",
  "folke/twilight.nvim",
  --{
  --	"folke/persistence.nvim",
  --	module = "persistence",
  --	config = function()
  --		require("persistence").setup()
  --	end,
  --},
  --{
  --	"goolord/alpha-nvim",
  --	dependencies = { "nvim-tree/nvim-web-devicons" },
  --	config = function()
  --		require("plugins.config.alpha")
  --	end
  --}
  --{
  --  "github/copilot.vim",
  --  config = function()
  --    vim.cmd[[
  --      imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
  --      let g:copilot_no_tab_map = v:true
  --    ]]
  --  end
  --}
})
