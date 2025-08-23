return {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter", -- Carrega o plugin ao entrar no modo de inserção
    dependencies = {
        'windwp/nvim-autopairs',
        'hrsh7th/cmp-nvim-lsp',   -- Fonte de sugestões para o LSP
        'hrsh7th/cmp-buffer',     -- Fonte para palavras do buffer atual
        'hrsh7th/cmp-path',       -- Fonte para caminhos de arquivos
        'L3MON4D3/LuaSnip',       -- Engine de Snippets (modelos de código)
        'saadparwaiz1/cmp_luasnip', -- Integração entre cmp e luasnip
    },
    config = function()
        local cmp_status_ok, cmp = pcall(require, 'cmp')
        if not cmp_status_ok then
          return
        end

        local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
        if not luasnip_status_ok then
          return
        end

        local autopairs_cmp = require('nvim-autopairs.completion.cmp')

        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          sources = cmp.config.sources({
            { name = 'luasnip' },
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'path' },
          }),
          mapping = cmp.mapping.preset.insert({
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<Tab>'] = cmp.mapping(function(fallback)
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local line = vim.api.nvim_get_current_line()
              local char_after_cursor = line:sub(col + 1, col + 1)

              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              -- Esta é a lógica que substitui o autopairs.can_jump()
              elseif char_after_cursor and vim.tbl_contains({')', ']', '}', '"', "'"}, char_after_cursor) then
                -- Move o cursor para a direita, saindo do par
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Right>', true, false, true), 'n', false)
              else
                fallback()
              end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { 'i', 's' }),
          }),
          formatting = {
              fields = { "kind", "abbr", "menu" },
              format = function(entry, vim_item)
                  -- Kind icons
                  vim_item.kind = string.format('%s', vim_item.kind)
                  vim_item.menu = ({
                      nvim_lsp = '[LSP]',
                      luasnip = '[Snippet]',
                      buffer = '[Buffer]',
                      path = '[Path]',
                  })[entry.source.name]
                  return vim_item
              end,
          },
        })
        cmp.event:on('confirm_done', autopairs_cmp.on_confirm_done())
    end,
}

