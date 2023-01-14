local function on_stdout(bufId, data)
  -- data is an array
  for _, value in ipairs(data) do
    local num = string.match(value, 'Found (%d)')
    if num ~= nil then
      vim.api.nvim_set_var('num_ts_errors', num)
      print(num .. ' errors!')
    end
  end
end

local M = {}

M.lint = function()
  local bufId = vim.api.nvim_create_buf(true, true)
  local opts = {
    on_stdout = function (id, data, event)
      on_stdout(bufId, data)
    end,
    pty = true
  }
  local jobId = vim.fn.jobstart({"bash", "-c", "npm run ts:watch"}, opts)
end

return M
