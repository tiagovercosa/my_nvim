return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()

    local nord = {
      polar_night = {
        origin = "#2E3440",
        bright = "#3B4252",
        dark   = "#434C5E",
        more_dark = "#4C566A",
      },
      snow_storm = {
        bright = "#ECEFF4",
        origin = "#E5E9F0",
        dark   = "#D8DEE9",
      },
      frost = {
        bright = "#8FBCBB",
        blue   = "#81A1C1",
        dark   = "#5E81AC",
        night  = "#88C0D0",
      },
      aurora = {
        bright = "#BF616A",
        orange = "#D08770",
        yellow = "#EBCB8B",
        green  = "#A3BE8C",
        purple = "#B48EAD",
      },
      sun = {
        bright = "#EBCB8B",
      },
      red = {
        bright = "#BF616A"
      }
    }

    require('bufferline').setup({
      options = {
        numbers = "ordinal",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        diagnostics = "nvim_lsp",
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        separator_style = "thick",
        enforce_regular_tabs = false,
        always_show_bufferline = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      },
      highlights = {
        fill = {
          guifg = { attribute = "fg", highlight = "Normal" },
          guibg = nord.polar_night.origin,
        },
        background = {
          guifg = nord.snow_storm.dark,
          guibg = nord.polar_night.origin,
        },
        buffer_selected = {
          guifg = nord.snow_storm.bright,
          guibg = nord.polar_night.bright,
          gui = "bold",
        },
        close_button = {
          guifg = nord.frost.bright,
          guibg = nord.polar_night.origin,
        },
        close_button_visible = {
          guifg = nord.frost.bright,
          guibg = nord.polar_night.origin,
        },
        close_button_selected = {
          guifg = nord.snow_storm.bright,
          guibg = nord.polar_night.bright,
        },
        diagnostic = {
          guifg = nord.aurora.bright,
          guibg = nord.polar_night.origin,
        },
        diagnostic_visible = {
          guifg = nord.aurora.bright,
          guibg = nord.polar_night.origin,
        },
        diagnostic_selected = {
          guifg = nord.aurora.bright,
          guibg = nord.polar_night.bright,
        },
        hint = {
          guifg = nord.aurora.bright,
          guibg = nord.polar_night.origin,
        },
        hint_visible = {
          guifg = nord.aurora.bright,
          guibg = nord.polar_night.origin,
        },
        hint_selected = {
          guifg = nord.aurora.bright,
          guibg = nord.polar_night.bright,
        },
        info = {
          guifg = nord.frost.bright,
          guibg = nord.polar_night.origin,
        },
        info_visible = {
          guifg = nord.frost.bright,
          guibg = nord.polar_night.origin,
        },
        info_selected = {
          guifg = nord.frost.bright,
          guibg = nord.polar_night.bright,
        },
        warning = {
          guifg = nord.sun.bright,
          guibg = nord.polar_night.origin,
        },
        warning_visible = {
          guifg = nord.sun.bright,
          guibg = nord.polar_night.origin,
        },
        warning_selected = {
          guifg = nord.sun.bright,
          guibg = nord.polar_night.bright,
        },
        error = {
          guifg = nord.red.bright,
          guibg = nord.polar_night.origin,
        },
        error_visible = {
          guifg = nord.red.bright,
          guibg = nord.polar_night.origin,
        },
        error_selected = {
          guifg = nord.red.bright,
          guibg = nord.polar_night.bright,
        },
      },
    })
  end
}
