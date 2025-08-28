return {
  'ray-x/lsp_signature.nvim',
  event = 'VeryLazy',
  config = function()
    require('lsp_signature').setup({
      bind = true,
      handler_opts = {
        border = 'rounded'
      },
      floating_window = false,
      hint_enable = true,
      hint_prefix = '🐼 ',
      hi_parameter = "Search",           -- Grupo de highlight para o parâmetro atual
      max_height = 12,                   -- Altura máxima da janela flutuante
      max_width = 80,                    -- Largura máxima da janela flutuante
      transparency = nil,                -- Transparência da janela flutuante (0-100)
      doc_lines = 10,                    -- Número de linhas de documentação para mostrar
      always_trigger = false,            -- Mostra a assinatura ao digitar qualquer caractere, não só "("
      auto_close_after = nil,            -- Fecha automaticamente após x segundos (nil = não fecha)
      zindex = 200,                      -- Z-index da janela flutuante
      toggle_key = "<M-x>",              -- Atalho para mostrar/ocultar manualmente

    })
  end,
}

