return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { 'clangd', 'pyright', 'ruff', 'fortls', 'lua_ls', 'texlab' },
        automatic_installation = true,
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
      }
      lspconfig.clangd.setup {
        capabilities = capabilities,
      }
      lspconfig.fortls.setup {
        capabilities = capabilities,
      }
      lspconfig.pyright.setup {
        capabilities = capabilities,
      }

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },
  dependencies = {
    "antosha417/nvim-lsp-file-operations",
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
      config = function()
        require("lsp-file-operations").setup()
      end,
    },
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        source = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.black,
        },
      })

      vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
    end
  },
  {
    "jay-babu/mason-null-ls.nvim",
    after = { "mason.nvim", "none-ls.nvim" },
    config = function()
      require("mason-null-ls").setup({
        automatic_installation = true,
      })
    end,
  },
}
