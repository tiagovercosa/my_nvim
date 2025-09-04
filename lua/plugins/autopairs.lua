return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    require('nvim-autopairs').setup({
      maps_pace = true,
      check_ts = true, -- integração com treesitter para pares inteligentes
      fast_wrap = {},  -- habilita wrap rápido
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
    })
  end,
}
