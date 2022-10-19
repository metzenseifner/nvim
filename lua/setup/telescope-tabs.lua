require('telescope-tabs').setup({
  entry_formatter = function(tab_id, buffer_ids, file_names, file_paths)
    local entry_string = table.concat(file_names, ', ')
    return string.format('%d: %s', tab_id, entry_string)
  end,
  entry_ordinal = function(tab_id, buffer_ids, file_names, file_paths)
    return table.concat(file_names, ' ')
  end,
  show_preview = true,
})
