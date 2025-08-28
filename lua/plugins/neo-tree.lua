return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons" ,
  },
  lazy = false,
  config = function()
    require("neo-tree").setup({
      close_if_last_window = false,
      popup_border_style = "NC",
      enable_git_status = true,
      enable_diagnostics = true,
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
          -- indent guides
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          -- expander config, needed for nesting files
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          git_status = {
            symbols = {
              -- Change type
              added = "+",
              modified = "",
              deleted = "✖",
              renamed = "󰁕",
              -- Status type
              untracked = "",
              ignored = "",
              unstaged = "󰄱",
              staged = "",
              conflict = "",
            },
          },
        },
      },
      window = {
        mappings = {
          ["l"] = function (state)
            local node = state.tree:get_node()
            if node.type == "file" then
              vim.cmd("Neotree close")
              vim.api.nvim_command("edit " .. node.path)
            else
              require("neo-tree.sources.filesystem").toggle_directory(state, node)
            end
          end,
          ["h"] = "close_node",
        }
      }
    })

    vim. keymap. set( 'n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})

  end
}
