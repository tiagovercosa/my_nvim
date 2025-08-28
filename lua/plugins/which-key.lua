return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  config = function ()
    require('which-key').setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = false,
          suggestions = 20,
        },
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
      hydra = {
        enabled = false,
        delay = 200,
        keys = {
          [""] = true,
          ["g"] = false,
          ["z"] = false,
        },
        blacklist = {},
      },
      quick_exit = {
        enabled = true,
        delay = 200,
        modes = { "n", "v" },
        single_char_only = false,
        special_keys_only = false,
      },
    })
  end
}
