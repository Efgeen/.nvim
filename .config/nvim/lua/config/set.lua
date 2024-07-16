vim.opt.gcr = "";

vim.opt.nu = true;
vim.opt.rnu = true;

vim.opt.ts = 0x04;
vim.opt.sts = 0x04;
vim.opt.sw = 0x04;
vim.opt.et = true;

vim.opt.si = true;

vim.opt.wrap = false;

vim.opt.swf = false;
vim.opt.bk = false;
vim.opt.udir = os.getenv("HOME") .. "/.nvim/udir";
vim.opt.udf = true;

vim.opt.hls = false;
vim.opt.is = true;

vim.opt.tgc = true;

vim.opt.so = 0x08;
vim.opt.scl = "yes";
vim.opt.isf:append("@-@");

vim.opt.ut = 0x32;

vim.opt.cc = "80";

