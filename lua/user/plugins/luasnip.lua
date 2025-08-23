-- lua/user/plugins/luasnip.lua
return {
    'L3MON4D3/LuaSnip',
    version = "v2.*",
    event = "InsertEnter",
    build = "make install_jsregexp",
    -- dependencies = { 'iurimateus/luasnip-latex-snippets.nvim' },
    config = function()
      require('luasnip').config.setup {
        enable_autosnippets = true
      }

      require("user.snippets.tex")

      -- require('luasnip-latex-snippets').setup({
      --     use_treesitter = false,
      --     allow_on_markdown = true,
      -- })

    end
}

