-- lua/user/plugins/luasnip.lua
return {
    'L3MON4D3/LuaSnip',
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { 'iurimateus/luasnip-latex-snippets.nvim' },
    config = function()
        local ls = require("luasnip")

        require('luasnip-latex-snippets').setup({
            use_treesitter = true,
            allow_on_markdown = true,
        })

        ls.config.setup({
          enable_autosnippets = true,
          -- OPTIONAL: remover para usar as defaults
          update_events = "TextChanged,TextChangedI",
          delete_check_events = "TextChanged",
        })
        require("luasnip.loaders.from_lua").load({
          paths = vim.fn.stdpath("config") .. "/lua/user/snippets"
        })
    end
}

