return {
  'neovim/nvim-lspconfig',
  dependencies = { 'saghen/blink.cmp' },
  lazy = false,
  config = function()
    local lspconfig = require('lspconfig')
    local util = require('lspconfig/util')
    local lspSettings = require('ram.lsp_settings')
    lspSettings.setup()
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    lspconfig.eslint.setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        lspSettings.on_attach(client, bufnr)
      end,
      capabilities = capabilities,
    })

    lspconfig.vtsls.setup({
      on_attach = lspSettings.on_attach,
      settings = {
        typescript = {
          tsserver = {
            maxTsServerMemory = 8192,
          },
        },
      },
      capabilities = capabilities,
    })

    lspconfig.terraformls.setup({
      on_attach = lspSettings.on_attach,
      capabilities = capabilities,
    })

    lspconfig.buf_ls.setup {
      root_dir = util.root_pattern("buf.yaml", ".git"),
      on_attach = lspSettings.on_attach,
      capabilities = capabilities,
    }

    lspconfig.lua_ls.setup {
      on_attach = lspSettings.on_attach,
      capabilities = capabilities,
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
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
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        })
      end,
      settings = {
        Lua = {}
      }
    }

    -- require('go').setup({})
    lspconfig.gopls.setup {
      cmd = { "gopls", "serve" },
      capabilities = capabilities,
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
      on_attach = lspSettings.on_attach
    }
  end
}
