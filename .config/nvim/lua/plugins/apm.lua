return {
    "ThePrimeagen/vim-apm",
    config = function()
        local apm = require("vim-apm");
        local reporter = require("vim-apm.reporter");
        local opts = vim.tbl_extend("force",
            reporter.default_options(),
            {
                interval_options = {
                    report_interval = 3 * 1000,
                    apm_repeat_count = 200,
                    apm_period = 3 * 1000,
                    apm_report_period = 0.25 * 1000
                }
            });
        apm:setup({
            reporter = opts
        });
        apm:toggle_monitor();
        vim.keymap.set("n", "<leader>tm", function()
            apm:toggle_monitor();
        end);
    end;
};

