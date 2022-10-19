require('lspconfig').jsonls.setup{
  on_attach = on_attach,
  -- add nvim-cmp capabilities to server.capabilities object
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  flags = lsp_flags,
  settings = {
    json = {
      validate = { enable = true },
      schemas = {
        {
          -- git clone --depth 1 ssh://git@bitbucket.lab.dynatrace.org/rx/configuration-core.git ~/devel/dynatrace_bitbucket/
          description = 'Settings 2.0 config',
          fileMatch = {'SlackConnection.schema.json'},
          -- url = 'https://bitbucket.lab.dynatrace.org/projects/RX/repos/configuration-core/raw/core-schema/src/main/resources/1/schema_strict_static.json?at=refs%2Fheads%2Fmaster'  -- FAILS due to Bitbucket auth
          url = "file://" .. vim.fn.expand('~') .. "/devel/dynatrace_bitbucket/configuration-core/core-schema/src/main/resources/1/schema_strict_static.json"
        }
}
    },
  }
}
