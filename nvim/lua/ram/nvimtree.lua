-- Automatically close NvimTree if it's the last split
-- :TODO: doesn't work if you open file via Telescope find_files for some reason
-- vim.cmd([[
-- autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- ]])

vim.api.nvim_create_user_command('Find', 'NvimTreeFindFile', { nargs = 0 })

require('nvim-tree').setup {
  respect_buf_cwd = true,
  create_in_closed_folder = true,
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    root_folder_modifier = ':~',
    highlight_opened_files = "none",
    highlight_git = true,
    group_empty = true,
    add_trailing = true,
    indent_markers = {
      enable = true
    },
    icons = {
      padding = ' ',
      symlink_arrow =  '>> ',
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = false,
      },
      glyphs = {
        symlink= "",
        git= {
          unstaged= "✗",
          staged= "✓",
          unmerged= "",
          renamed= "➜",
          untracked= "★",
          deleted= "",
          ignored= "◌"
        },
        folder= {
          arrow_open= "",
          arrow_closed= "",
          default= "",
          open= "",
          empty= "",
          empty_open= "",
          symlink= "",
          symlink_open= "",
        }
      }
    },
  }
}
