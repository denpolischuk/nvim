--
-- BEGIN: INDENTATION
--
vim.opt.tabstop = 2 -- number of visual spaces per TAB
vim.opt.shiftwidth = 2 -- spaces used for autoindent
vim.opt.expandtab = true -- convert TABs to spaces
vim.opt.softtabstop = 2 -- how many spaces TAB key inserts
vim.opt.autoindent = true
vim.opt.smartindent = true
--
-- END: INDENTATION --
--

--
-- BEGIN: LOOK
--
vim.cmd.colorscheme("habamax")
vim.opt.relativenumber = true
vim.opt.number = true -- keeps the absolute number on the current line
vim.o.statusline = table.concat({
  "%f",             -- filename
  " %m",            -- modified flag
  " %r",            -- readonly flag
  " %{v:lua.StatuslineGit()}", -- ← git info 
  " %=%l:%c",       -- right align: line:col
})
--
-- END: LOOK
--

