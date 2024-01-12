vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.virtualedit = "block"
vim.opt.termguicolors = true
vim.opt.inccommand = "split"

vim.opt.clipboard = "unnamedplus"
vim.opt.fileformat = "unix"

vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartcase = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.list = true
vim.opt.pumblend = 10
vim.opt.pumheight = 10
vim.opt.signcolumn = "yes"

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 999
vim.opt.smoothscroll = true

vim.opt.undofile = true
vim.opt.undolevels = 10000

vim.opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}

vim.g.markdown_recommended_style = 0
vim.opt.foldenable = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 6
vim.opt.foldminlines = 5
