local M = {}

M.ci = function()
  local opts = {
    on_stdout = function (jobId, data, event)
      print(vim.inspect(data))
    end,
  }
  local jobId = vim.fn.jobstart("printf 'hello'", opts)
end

return M
