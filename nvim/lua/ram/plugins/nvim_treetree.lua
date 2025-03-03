return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
  respect_buf_cwd = true,
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
      symlink_arrow = '>> ',
      show = {
        git = true,
        folder = true,
        file = true,
        folder_arrow = false,
      },
      glyphs = {
        symlink = "",
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌"
        },
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        }
      }
    },
  }
}
}
