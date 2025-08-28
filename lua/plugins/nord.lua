return {
  'shaunsingh/nord.nvim',
  name = 'nord',
  priority = 1000,
  config = function ()
    vim.cmd [[
          highlight Normal guibg=NONE ctermbg=NONE
          highlight LineNr guifg=#4C566A
          ]]
    vim.g.nord_contrast = false
    vim.g.nord_borders = false
    vim.g.nord_disable_background = false
    vim.g.nord_italic = true
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = true

    -- Load the colorscheme
    require('nord').set()
    vim.cmd.colorscheme('nord')
  end
}
