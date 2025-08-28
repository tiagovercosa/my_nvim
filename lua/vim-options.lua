---@diagnostic disable: undefined-global

-- Configuração básica para Neovim
local opt = vim.opt

opt.number = true		          -- Mostrar números das linhas
opt.relativenumber = true	      -- Mostrar números relativos às linhas
opt.tabstop = 2                   -- Tamanho de um <Tab>
opt.shiftwidth = 2                -- Largura para indentação
opt.softtabstop = 2
opt.expandtab = true              -- Usar espaços em vez de <Tab>
opt.autoindent = true             -- Indentação automática
opt.smartindent = true            -- Indentação inteligente para novas linhas
opt.wrap = false                  -- Não quebrar linhas longas
opt.hlsearch = true               -- Destacar resultados da busca
opt.incsearch = true              -- Mostrar resultados da busca enquanto digita
opt.scrolloff = 8                 -- Manter 8 linhas de contexto acima/abaixo do cursor
opt.ignorecase = true             -- Ignorar maiúsculas/minúsculas na busca
opt.smartcase = true              -- A não ser que a busca contenha uma letra maiúscula
opt.termguicolors = true          -- Habilitar cores de 24-bit no terminal
opt.cursorline = true             -- Destaca a linha inteira onde o cursor está posicionado
opt.showcmd = true                -- Exibe comandos parciais no canto inferior direito da tela
opt.cmdheight = 2                 -- Define a altura da área da linha de comando
opt.colorcolumn = "80"            -- Desenha uma linha vertical na coluna
opt.signcolumn = "yes"            -- Coluna de sinais sempre visível
opt.clipboard = "unnamedplus"     -- Integra a área de transferência do Neovim com a do sistema operacional
opt.encoding = "utf-8"            -- Codificação de caracteres padrão para os arquivos
opt.showmode = false              -- disable in favor of lualine statusline
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.swapfile = false          -- opcional, se preferir desabilitar swap
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undo'
vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileformats = { "unix", "dos", "mac" }
vim.opt.autoread = true
vim.api.nvim_create_autocmd({"FocusGained","BufEnter","CursorHold","CursorHoldI"}, {
  command = "checktime"
})

vim.cmd [[
  filetype on                   " enable filetype detection
  filetype plugin on            " load file-specific plugins
  filetype indent on            " load file-specific indentation

  set whichwrap+=<,>,[,],h,l
]]

-- Cria diretório de backup caso não exista
local backup_dir = vim.fn.stdpath('cache') .. '/backup'
vim.opt.backupdir = backup_dir

if not vim.fn.isdirectory(backup_dir) then
  vim.fn.mkdir(backup_dir, 'p')
end

-- Configura a aparência dos diagnósticos
vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = '●',
    severity = { min = vim.diagnostic.severity.WARN },
  },
  float = {
    border = "rounded",
    source = "always",
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "󰌵",
    },
  },
})

-- Habilita a verificação ortográfica
vim.opt.spelllang = 'en_us,pt'
-- Ativar correção ortográfica em pt_br com comando
vim.cmd([[
  command! SpellOn  setlocal spell spelllang=pt
  command! SpellOff setlocal nospell
]])

-- Configuração para pynvim
vim.g.python3_host_prog = "/Users/tiago/.local/share/pyenv/neovim/bin/python3"

