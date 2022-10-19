require"gitlinker".setup({
  --function()
  --  vim.api.nvim_set_keymap('n', '<leader>gY', '<cmd>lua require"gitlinker".get_repo_url()<cr>', {silent = true})
  --  vim.api.nvim_set_keymap('n', '<leader>gB', '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true})
  --end

  opts = {
    remote = nil, -- force the use of a specific remote
    -- adds current line nr in the url for normal mode
    add_current_line_on_normal_mode = true,
    -- callback for what to do with the url
    action_callback = function(url)
      -- original: require"gitlinker.actions".copy_to_clipboard,
      --yank to unnamed register
      vim.api.nvim_command('let @" = \'' .. url ..'\'') 
      -- copy to sys clipboard
      --require('osc52').copy_register('@"')
      require('osc52').copy(url)
      end,
    -- print the url after performing the action
    print_url = true,
  },
  --url_data = {
  --  host = "bitbucket.lab.dynatrace.org",
  --  port = nil, --"3000" or nil,
  --  repo = "<user/repo>",
  --  rev = "<commit sha>",
  --  file = "<path/to/file/from/repo/root>",
  --  lstart = 42, -- the line start of the selected range / current line
  --  lend = 57, -- the line end of the selected range
  --},
  callbacks = {
        ["bitbucket.lab.dynatrace.org"] = function(url_data)
          -- http://lua-users.org/wiki/StringLibraryTutorial
          -- Example URLs
          -- User URL: 
          --   https://bitbucket.lab.dynatrace.org/users/jonathan.komar/repos/github-automation-app/browse
          --   ssh://git@bitbucket.lab.dynatrace.org/~jonathan.komar/github-automation-app.git
          -- Non-User URL: 
          --   https://bitbucket.lab.dynatrace.org/projects/APPS/repos/dynatrace-app-template/browse
          --   ssh://git@bitbucket.lab.dynatrace.org/apps/dynatrace-app-template.git
          -- Non-User URL: 
          --   https://bitbucket.lab.dynatrace.org/projects/APPS/repos/slack-app/browse
          --   ssh://git@bitbucket.lab.dynatrace.org/autoapp/slack-app.git
          -- {+bitbucket}{/owner, repository_name}/src{/commitish}{/filepath}{?fileviewer}{#fileline}
          function isUserNamespace(url_data, username)
            if string.find(url_data.repo, username) then
              return true
            else
              return false
            end
          end

          function extractRepo(url_data)
              local index_of_slash = string.find(url_data.repo, "/", 1)
              local repo = string.sub(url_data.repo, index_of_slash+1, -1)
              return repo
          end

          function extractProjectNamespace(url_data)
            local index_of_slash = string.find(url_data.repo, "/", 1)
            local project_ns = string.sub(url_data.repo, 1, index_of_slash-1)
            return project_ns
          end

          function getNamespace(predicate, url_data)
            if isUserNamespace(url_data, "jonathan.komar") then
              return "/users/jonathan.komar"
            else
              return "/projects/" .. extractProjectNamespace(url_data)
            end
          end
          
          local url = 
            "https://" .. 
            url_data.host ..
            getNamespace(isUserNamespace, url_data) .. 
            "/repos/" .. 
            extractRepo(url_data) .. 
            "/browse"

          if url_data.file then
            url = url .. "/" .. url_data.file
          end
          --https://bitbucket.lab.dynatrace.org/projects/APPFW/repos/appfw-spec/browse/serverless/runtime-reference.md?useDefaultHandler=true&https://bitbucket.lab.dynatrace.org/projects/APPFW/repos/appfw-spec/browse/serverless/runtime-reference.md?useDefaultHandler=true&at=4aa00b425ddf80fdb75de9a28006cbd638fdf8c6#40
          -- use useDefaultHandler=true for markdown
          if url_data.rev then
            url = url .. "?useDefaultHandler=true&at=" .. url_data.rev 
          end
          if url_data.lstart then
            url = url .. "#" .. url_data.lstart
            if url_data.lend then
              url = url .. "-" .. url_data.lend 
            end
          end
          --for key, value in pairs(url_data) do
          --  print(key .. ": " .. value)
          --end 
          return url
          --require"gitlinker.hosts".get_gitea_type_url(url_data)
        end
  },
-- default mapping to call url generation with action_callback
  mappings = "<leader>gy"
})
