return {
	"scrooloose/nerdcommenter",
	"junegunn/vim-easy-align",
	"sbdchd/neoformat",
	"neomake/neomake",
	"kylechui/nvim-surround",
	{"windwp/nvim-autopairs", enable_check_bracket_line = false, ignored_nexty_char = "[%w%.]"},
	{"kkoomen/vim-doge", build = "npm -i --no-save && npm run build:binary:unix"},
}