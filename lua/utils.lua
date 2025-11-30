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
