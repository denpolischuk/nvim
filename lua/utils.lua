-- Git information provider for statusline
function _G.StatuslineGit()
  -- Check if we're inside a git repo
  vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null")
  if vim.v.shell_error ~= 0 then
    return "" -- no git repo
  end

  -- Branch name
  local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null"):gsub("\n", "")

  -- Diff summary using numstat
  local diff_output = vim.fn.system("git diff --numstat 2>/dev/null")

  local added, modified, removed = 0, 0, 0

  -- Parse lines like: "12 8 path/file"
  for a, d in diff_output:gmatch("(%d+)%s+(%d+)%s+") do
    a = tonumber(a)
    d = tonumber(d)

    -- In numstat:
    -- a > 0 → added lines
    -- d > 0 → deleted lines
    if a > 0 then added = added + a end
    if d > 0 then removed = removed + d end
    if a > 0 and d > 0 then modified = modified + math.min(a, d) end
  end

  -- Build string
  return string.format(" %s +%d ~%d -%d", branch, added, modified, removed)
end
