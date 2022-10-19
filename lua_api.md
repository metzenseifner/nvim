
vim is a global variable to access vimscript API

Lua calls namespaces, scopes

- vim.g scope global
- vim.o scope general settings
- vim.wo scope window
- vim.bo scope buffer
- vim.env scope environment variables
- vim.opt scope global window and buffer settings

A trick to make Lua syntax resemble vimscript is to assign a scope to a
symbol that has the same name in vimscript (local is required, because
lua vars are global by default):

Example turning this vimscript into Lua:

```
" Set the behavior of tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
```

```
local set = vim.opt

-- Set the behavior of tab
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
```

Some names in vimscript are illegal in lua or are reserved keywords, 
therefore can be accessed by string only:
Use index notation rather than dot notation. 

```
vim.g['zoom#statustext'] = 'Z'
````


Get value of a setting requires a `:get()` suffix

```
print(vim.opt.autoindent:get())
```

Get value and all metadata:

```
print(vim.inspect(vim.opt.autoindent))
```

