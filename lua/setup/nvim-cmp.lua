local cmp = require('cmp')
local select_opts = { behavior = cmp.SelectBehavior.Select }
cmp.setup {

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts), --cmp.mapping.select_prev_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts), --cmp.mapping.select_next_item(),
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-Space>'] = cmp.mapping.complete(select_opts),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-y>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  formatting = {
    format = require('lspkind').cmp_format {
      with_text = true,
      menu = {
        buffer   = "[buf]",
        nvim_lsp = "[LSP]",
        path     = "[path]",
      },
    },
  },
  completion = { -- adds autocompletion suggestions menu while typing
    keyword_length = 1,
    completeopt = "menu,menuone,noselect",
  },
  views = { -- what does this do?
    entries = 'custom',
  },
  sources = {
    -- lua table with name prop whose value is id of plugin that provides data 
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
    { name = "luasnip", keyword_length = 5},
  },
  experimental = {
    ghost_text = true
  }
}
