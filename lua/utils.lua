-- Return formatted statusline fragment
function _G.StatuslineGit()
  local gs = vim.b.gitsigns_status_dict
  if not gs or not gs.head then
    return ""
  end

  return string.format(
    " %s [A:%d M:%d D:%d]",
    gs.head,
    gs.added or 0,
    gs.changed or 0,
    gs.removed or 0
  )
end

function LspStatus()
  local buf = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = buf })

  if not clients or vim.tbl_isempty(clients) then
    return ""
  end

  local names = {}
  for _, c in pairs(clients) do
    table.insert(names, c.name)
  end

  return " " .. table.concat(names, ",")
end

