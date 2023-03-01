local map = vim.keymap.set

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  map('n', '<space>e', vim.diagnostic.open_float, bufopts)
  map('n', '[d', vim.diagnostic.goto_prev, bufopts)
  map('n', ']d', vim.diagnostic.goto_next, bufopts)
  map('n', '<space>q', vim.diagnostic.setloclist, bufopts)

  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map('n', 'wa', vim.lsp.buf.add_workspace_folder, bufopts)
  map('n', 'wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  map('n', 'wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  map('n', 'D', vim.lsp.buf.type_definition, bufopts)
  map('n', 'rn', vim.lsp.buf.rename, bufopts)
  map('n', 'ca', vim.lsp.buf.code_action, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)

  client.server_capabilities.documentFormattingProvider = false
  map('n', 'f', function()
    vim.lsp.buf.format { async = true }
  end, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local config = {
  widget_guides = { enabled = true },
  lsp = {
    on_attach = on_attach,
    capabilities = capabilities,
    color = {
      enabled = true,
      background = true,
      virtual_text = true,
    },
    settings = {
      showTodos = false,
      renameFilesWithClasses = 'prompt',
      updateImportsOnRename = true,
      completeFunctionCalls = true,
      lineLength = 100,
      enableSnippets = true,
    },
  },
}

require("flutter-tools").setup(config)
require("telescope").load_extension("flutter")
