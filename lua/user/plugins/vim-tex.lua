---@diagnostic disable: undefined-global

return {
    'lervag/vimtex',
    lazy = false,
    init = function ()
        vim.g.tex_flavor = 'latex'
        vim.g.vimtex_view_method = 'skim'
        vim.g.vimtex_quickfix_mode = 0
        vim.g.conceallevel = 1
        vim.g.tex_conceal = 'abdmg'

        vim.api.nvim_create_augroup("vimtex_mac", { clear = true })

        vim.api.nvim_create_autocmd("User", {
            group = "vimtex_mac",
            pattern = "VimtexEventCompileSuccess",
            callback = function ()
                local viewer = "/Applications/Skim.app/Contents/SharedSupport/displayline"
                local out = vim.b.vimtex.out
                local src_file_path = vim.fn.expand('%:p')
                local cmd = { viewer, "-r", "@" .. tostring(vim.fn.line('.')), out,
            src_file_path}
            vim.fn.jobstart(cmd)
            end
        })

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
