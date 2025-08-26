---@diagnostic disable: undefined-global

return {
    'lervag/vimtex',
    lazy = false,
    init = function ()
        vim.g.tex_flavor = 'latex'
        vim.g.vimtex_view_method = "sioyek"
        vim.g.vimtex_quickfix_mode = 0
        vim.g.conceallevel = 1
        vim.g.tex_conceal = 'abdmg'

        vim.g.vimtex_compiler_latexmk = {
            executable = 'latexmk',
            options = {
                '-pdf',
                '-shell-escape',
                '-interaction=nonstopmode',
                '-synctex=1',
            },
        }

    end
}
