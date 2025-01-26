local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local handlers = require('ram.lsp.handlers')


-- configure eslint
lspconfig.eslint.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    handlers.on_attach(client, bufnr)
  end
})

lspconfig.terraformls.setup({
  on_attach = handlers.on_attach
})

lspconfig.buf_ls.setup {
  root_dir = util.root_pattern("buf.yaml", ".git"),
  on_attach = handlers.on_attach
}

lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })
      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end,
  on_attach = handlers.on_attach
}

-- require('go').setup({})
lspconfig.gopls.setup {
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      env = { GOFLAGS = "-tags=integration,integration_db_only,tools" },
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  on_attach = handlers.on_attach
}

local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    null_ls.builtins.code_actions.gomodifytags
  },
}

-- print(vim.inspect(params))
-- {
--   bufnr = 22,
--   client_id = 2,
--   ft = "go",
--   lsp_method = "textDocument/codeAction",
--   lsp_params = {
--     client_id = 2,
--     context = {
--       diagnostics = {},
--       triggerKind = 1
--     },
--     method = "textDocument/codeAction",
--     range = {
--       ["end"] = <1>{
--         character = 1,
--         line = 51
--       },
--       start = <table 1>
--     },
--     textDocument = {
--       uri = "..."
--     }
--   },
--   method = "NULL_LS_CODE_ACTION",
--   source_id = 2,
--   <metatable> = {
--     __index = <function 1>
--   }
-- }


local is_in_struct = function()
  local node = vim.treesitter.get_node()
  local root = node:tree():root()
  while node:parent() ~= nil and node:parent() ~= root do
    node = node:parent()
  end
  return node:type() == "type_declaration"
end

null_ls.register({
  method = null_ls.methods.CODE_ACTION,
  filetypes = { 'go' },
  generator = {
    fn = function()
      local t = is_in_struct()
      if t then
        return {
          {
            title = 'Delete Struct',
            action = function()
              -- todo: the logic to execute once this action is selected goes here
              vim.notify("this dude...")
            end
          }
        }
      end
    end,
  },
})

require('typescript-tools').setup({
  on_attach = handlers.on_attach
})
