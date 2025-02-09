local function formatter()
  local result = require("conform").list_formatters(vim.fn.bufnr("%"))[1]["name"]
  if formatter == nil then
    return "None"
  end
  return result
end

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_y, 1, formatter)
  end,
}
