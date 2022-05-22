local function set_option(name, value)
  local full_option_name = "nvim_tree_" .. name
  vim.api.nvim_set_var(full_option_name, value)
end

vim.api.nvim_set_var("renderer.indent_markers.enable", 1)
set_option("git_hl", 1) -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
set_option("highlight_opened_files", 1) -- 0 by default, will enable folder and file icon highlight for opened files/directories.
set_option("root_folder_modifier", ':~') -- This is the default. See :help filename-modifiers for more options
set_option("add_trailing", 1) -- 0 by default, append a trailing slash to folder names
set_option("group_empty", 1) -- 0 by default, compact folders that only contain a single folder into one node in the file tree
set_option("icon_padding", ' ') -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
set_option("symlink_arrow", '>> ') --  defaults to ' ➛ '. used as a separator between symlinks' source and target.
set_option("respect_buf_cwd", 1) -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
set_option("create_in_closed_folder", 1)  -- 0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.

-- Automatically close NvimTree if it's the last split
-- :TODO: doesn't work if you open file via Telescope find_files for some reason
-- vim.cmd([[
  -- autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- ]])

vim.cmd([[
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 0,
    \ }
  ]])

vim.cmd([[
let g:nvim_tree_icons = {
    \ 'symlink': "",
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }
]])

vim.api.nvim_create_user_command('Find', 'NvimTreeFindFile', {nargs = 0})

require('nvim-tree').setup {
  actions = {
    open_file = {
      resize_window = true,
    },
  },
}
