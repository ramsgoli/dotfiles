local function c(name, fn)
  vim.api.nvim_create_user_command(name, fn, {})
end

c(
  'CopyFileName',
  function()
    vim.fn.setreg('*', vim.fn.expand('%:p'))
  end
)

local function openJira()
  local jiraTag = vim.fn.expand("<cfile>")
  -- TODO validate that `jiraTag` matches `HEAP-xxxxx`
  vim.fn.system("open https://heapinc.atlassian.net/browse/" .. jiraTag)
end

vim.api.nvim_create_user_command(
  'OpenJira',
  openJira,
  {}
)

local function openGitHub()
  local lineNum = unpack(vim.api.nvim_win_get_cursor(0))
  local fullFileName = vim.fn.expand('%:p')
  local pathFromGitRoot = vim.fn.system('git ls-files --full-name ' .. fullFileName .. ' | tr -d "\n"')
  local url = 'https://github.com/heap/heap/blob/develop/' .. pathFromGitRoot .. '#L' .. lineNum
  print('opening ' .. url)
  vim.fn.system('open ' .. url)
end

c('OpenGitHub', openGitHub)

c(
  'Buffers',
  function()
    vim.api.nvim_command('Telescope buffers')
  end
)

c(
  'Symbols',
  function()
    vim.api.nvim_command('Telescope lsp_dynamic_workspace_symbols')
  end
)

c(
  'DocSymbols',
  function()
    vim.api.nvim_command('Telescope lsp_document_symbols')
  end
)

c(
  'Rename',
  function()
    vim.lsp.buf.rename()
  end
)
