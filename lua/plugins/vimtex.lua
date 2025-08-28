---@diagnostic disable: undefined-global

return {
  'lervag/vimtex',
  lazy = false,
  init = function ()
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_view_method = "sioyek"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.tex_conceal = 'abdmg'

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'tex',
      callback = function()
        vim.opt_local.conceallevel = 2
        vim.opt_local.concealcursor = 'n'
      end,
      desc = 'VimTeX conceal settings'
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
