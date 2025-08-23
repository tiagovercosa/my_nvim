return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local nvim_tree = require("nvim-tree")
    local api = require("nvim-tree.api")

    -- A função on_attach é o novo padrão para definir atalhos
    local function on_attach(bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr, nowait = true }

      vim.keymap.set('n', 'l', api.node.open.edit, opts)
      vim.keymap.set('n', 'h', function()
        local node = api.tree.get_node_under_cursor()
        if node.type == "directory" and node.open then
          api.node.open.edit() -- Fecha a pasta
        else
          api.tree.change_root_to_parent() -- Vai para o pai
        end
      end, opts)

      -- Manipulação de arquivos
      vim.keymap.set('n', 'a', api.fs.create, opts)      -- Adicionar arquivo/pasta
      vim.keymap.set('n', 'r', api.fs.rename, opts)      -- Renomear
      vim.keymap.set('n', 'd', api.fs.remove, opts)      -- Deletar
      vim.keymap.set('n', 'c', api.fs.copy.node, opts)   -- Copiar
      vim.keymap.set('n', 'x', api.fs.cut, opts)         -- Recortar (Mover)
      vim.keymap.set('n', 'p', api.fs.paste, opts)       -- Colar
      vim.keymap.set('n', 'y', api.fs.copy.filename, opts) -- Copiar nome do arquivo
    end

    -- Configuração principal
    nvim_tree.setup({
      -- Desativamos a configuração de atalhos antiga
      -- E passamos a nossa nova função on_attach
      on_attach = on_attach,

      -- Outras opções (como a largura) continuam aqui
      view = {
        width = 30,
      },
    })

  end,
}

