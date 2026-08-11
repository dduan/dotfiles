vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }
vim.o.winborder = 'double'
vim.o.pumborder = 'double'

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-completion', { clear = true }),
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end
  end,
})

vim.keymap.set('i', '<C-Space>', vim.lsp.completion.get)
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end, { expr = true })
vim.keymap.set('i', '<S-Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
end, { expr = true })
vim.keymap.set('i', '<CR>', function()
  if vim.fn.pumvisible() ~= 1 then
    return '<CR>'
  end
  if vim.fn.complete_info({ 'selected' }).selected == -1 then
    return '<C-n><C-y>'
  end
  return '<C-y>'
end, { expr = true })

vim.lsp.enable({
  'sourcekit',
  'rust_analyzer',
  'pyright',
  'zls',
  'gopls',
  'templ',
})

-- Show diagnostics for the current line in a floating window
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.INFO]  = "",
            [vim.diagnostic.severity.HINT]  = "",
        },
    },
})
