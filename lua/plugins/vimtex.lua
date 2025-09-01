---@diagnostic disable: undefined-global

return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_view_skim_activate = 1
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_skim_reading_bar = 1
    vim.g.vimtex_quickfix_mode = 0
    vim.g.tex_conceal = 'abdmg'

    -- Configurações de completude
    vim.g.vimtex_complete_enabled = 1
    vim.g.vimtex_complete_close_braces = 1

    -- Configurações de fold
    vim.g.vimtex_fold_enabled = 1
    vim.g.vimtex_fold_manual = 1

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
