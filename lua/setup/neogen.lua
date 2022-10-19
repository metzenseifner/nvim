require('neogen').setup({
  enabled = true,
  input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
  languages = {
    lua = {
      template = {
        annotation_convention = "emmylua" -- for a full list of annotation_conventions, see supported-languages below,
      }
    },
    typescript = {
      template = {
        annotation_convention = "tsdoc"
      }
    },
    typescriptreact = {
      template = {
        annotation_convention = "tsdoc"
      }
    },
    rust = {},
    python = {},
    ruby = {},
  }
})
