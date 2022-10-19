local actions = require 'telescope.actions'

require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,

    path_display = { "smart" },
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-i>"] = "which_key",
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-g>"] = actions.move_to_top,
        ["<C-G>"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
        ["?"] = actions.which_key,
      },
      n = {
        ["esc"] = actions.close,
        ["<CR>"] = actions.select_default,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    find_files = {
      theme = "dropdown",
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
      --find_command = { "perl", "-Prn" }
    }
  },
  extensions = {
    ["ui-select"] = {
      require('telescope.themes').get_dropdown {}
    },
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    workspaces = {
      -- stay in insert mode after selection in picker
      keep_insert = true,
    },
  }
}

function install_extension(name)
  require('telescope').load_extension(name)
end

install_extension("file_browser")
install_extension("mapper")
install_extension("workspaces")
install_extension("ui-select")
install_extension("bookmarks")
install_extension("repo")
install_extension("gh")
install_extension("packer")
--install_extension()
