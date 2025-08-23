return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
        local function disable_for_large_markdown(lang, bufnr)
          return lang == "markdown" and vim.api.nvim_buf_line_count(bufnr) > 500
        end

        require('nvim-treesitter.configs').setup {
            ensure_installed = { 'c', 'lua', 'python', 'cpp', 'fortran', 'latex' },
            auto_install = true,
            highlight = {
              enable = true,
              disable = disable_for_large_markdown,
            },
        }
    end
}

