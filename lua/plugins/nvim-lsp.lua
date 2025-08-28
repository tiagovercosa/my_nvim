---@diagnostic disable: undefined-global

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    "antosha417/nvim-lsp-file-operations",
  },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    mason.setup()

    -- Função on_attach para mapear atalhos LSP por buffer
    local function on_attach(client, bufnr)
      require("nvim-lsp-file-operations").attach(client, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      local bufmap = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = 'LSP: ' .. desc })
      end

      bufmap('n', 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
      bufmap('n', 'K',  vim.lsp.buf.hover, 'Hover Documentation')
      bufmap('n', 'rn', vim.lsp.buf.rename, '[G]oto [R]ename')
      bufmap('n', 'gr', vim.lsp.buf.references, '[G]oto [R]eferences')
      bufmap('n', 'ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    end

    -- Configuração padrão a ser usada pela maioria dos servidores
    local default_config = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    mason_lspconfig.setup({
      ensure_installed = { 'clangd', 'pyright', 'ruff', 'fortls', 'lua_ls', 'texlab' },
      automatic_installation = true,
      handlers = {
        -- Handler padrão para servidores que não precisam de configuração especial.
        -- Isso vai cuidar de clangd, pyright, e fortls.
        function (server_name)
          lspconfig[server_name].setup(default_config)
        end,

        -- Handler específico para texlab
        texlab = function ()
          -- Clona a configuração padrão para não afetar os outros servidores
          local texlab_config = vim.deepcopy(default_config)
          -- Desativa a capacidade de snippets especificamente para o texlab
          if texlab_config.capabilities.textDocument.completion.completionItem then
            texlab_config.capabilities.textDocument.completion.completionItem.snippetSupport = false
          end
          -- Inicia o texlab com a configuração modificada
          lspconfig.texlab.setup(texlab_config)
        end,

        ruff_lsp = function()
          lspconfig.ruff_lsp.setup(vim.tbl_extend('force', default_config, {
            init_options = {
              settings = {
                args = {
                  "--select=E,W,F,I,N,B,A,C,T,S",
                  "--ignore=E501", -- Ignora linha muito longa (exemplo)
                },
              }
            }
          }))
        end,

        -- Handler específico para lua_ls
        lua_ls = function ()
          -- Usa a configuração padrão e adiciona as configurações específicas do lua_ls
          lspconfig.lua_ls.setup(vim.tbl_extend('force', default_config, {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' },
                },
              },
            },
          }))
        end
      }
    })
  end,
}

