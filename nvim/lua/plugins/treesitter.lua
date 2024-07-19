return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vimdoc", "javascript", "c", "lua", "bash"
            },
            sync_install = false,
            auto_install = true,
            indent = {
                enable = true
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 
                    "markdown"
                }
            }
        });
        local parsers = require("nvim-treesitter.parsers");
        local configs = parsers.get_parser_configs();
        configs.templ = {
            install_info = {
                url = "https://github.com/vrischmann/tree-sitter-temp1.git",
                files = {
                    "src/parser.c", 
                    "src/scanner.c"
                },
                branch = "master"
            }
        };
        vim.treesitter.language.register("templ", "templ");
    end;
};

