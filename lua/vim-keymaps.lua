---@diagnostic disable: undefined-global

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Define a tecla Leader (geralmente '\' ou ',')
vim.g.mapleader = ','             -- Define a tecla Leader como "espaço".
vim.g.maplocalleader = ','	      -- Define a tecla Local Leader como "espaço".

map('n', '<C-h>', '<C-w>h', { desc = "Move to left window" })
map('n', '<C-j>', '<C-w>j', { desc = "Move to down window" })
map('n', '<C-k>', '<C-w>k', { desc = "Move to up window" })
map('n', '<C-l>', '<C-w>l', { desc = "Move to right window" })

-- Navegar entre buffers
map('n', '<S-l>', ':bnext<CR>', { desc = "Next buffer" })
map('n', '<S-h>', ':bprevious<CR>', { desc = "Previous buffer" })

-- Mover linhas
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Atalhos para navegar pelos erros
map('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

map('i', '<C-a>', '<c-g>u<Esc>[s1z=`]a<c-g>u', {
  noremap = true,
  silent = true,
  desc = 'Corrige a palavra anterior com a primeira sugestão'
})

-- Atalhos do VimTeX (prefixo \)
map('n', '\\ll',  '<cmd>VimtexCompile<CR>', opts)        -- Compilar
map('n', '\\lk',  '<cmd>VimtexStopCompile<CR>', opts)    -- Parar compilação
map('n', '\\lv',  '<cmd>VimtexView<CR>', opts)           -- Abrir visualizador PDF
map('n', '\\li',  '<cmd>VimtexCompileOutput<CR>', opts)  -- Mostrar log da compilação
map('n', '\\le',  '<cmd>VimtexErrors<CR>', opts)         -- Abrir lista de erros
map('n', '\\lc',  '<cmd>VimtexClean<CR>', opts)          -- Limpar auxiliares de compilação
map('n', '\\lt',  '<cmd>VimtexTocToggle<CR>', opts)      -- Toggle table of contents

-- Navegação em LaTeX
map('n', ']]', '<cmd>VimtexNextEnv<CR>', opts)           -- Próximo ambiente LaTeX
map('n', '[[', '<cmd>VimtexPrevEnv<CR>', opts)           -- Ambiente anterior
map('n', ']m', '<cmd>VimtexNextSection<CR>', opts)       -- Próxima seção
map('n', '[m', '<cmd>VimtexPrevSection<CR>', opts)       -- Seção anterior

-- Ajuda rápida para comando LaTeX sob cursor
map('n', 'K', '<cmd>VimtexDocPackage<CR>', opts)

-- bufferline
map('n', '<leader>l', ':bnext<CR>', opts)
map('n', '<leader>h', ':bprev<CR>', opts)
map('n', '<leader>q', ':bdelete<CR>', opts)
map('n', '<leader><tab>', ':buffer #<CR>', opts)
map('n', '<leader>b', ':buffers<CR>', opts)

