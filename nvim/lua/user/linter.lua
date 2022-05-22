local function on_stdout(chanId, data)
  print(vim.inspect(data))
  vim.fn.chansend(chanId, data)
end

local function lint()
  local bufId = vim.api.nvim_create_buf(true, true)
  local chanId = vim.api.nvim_open_term(bufId, {})

  local opts = {
    on_stdout = function (id, data, event)
      on_stdout(chanId, data)
    end
  }
  local jobId = vim.fn.jobstart({"bash", "-c", "npm run ts:watch"}, opts)
end

return {
  lint = lint
}
