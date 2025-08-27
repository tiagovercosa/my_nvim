return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()

        require('nvim-treesitter.configs').setup {
            ensure_installed = { 'c', 'lua', 'python', 'cpp', 'fortran', 'latex' },
            auto_install = true,
            highlight = {
              enable = true,
              disable = { "latex" },
            },
        }
    end
}

