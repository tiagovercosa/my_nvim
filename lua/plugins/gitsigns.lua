return {
  'lewis6991/gitsigns.nvim',
  config = function ()
    require('gitsigns').setup({
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      current_line_blame = false, -- Ative com `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      signcolumn = true, -- Ative/desative os sinais. Use `:Gitsigns toggle_signs`
      numhl = false,     -- Destaque do número da linha com mudanças
      linehl = false,    -- Destaque da linha inteira com mudanças
      word_diff = false, -- Mostrar diffs por palavra
      preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
      base = 'HEAD',
      watch_gitdir = {
        follow_files = true,
        interval = 1000,
        patterns = { '**/.git/index', '**/.git/HEAD' },
      },
      attach_to_untracked = true,
      update_debounce = 100,
    })
  end
}
