---------------------------------------------------------------------------
-- Dashboard config show on start
-- Source: https://github.com/goolord/alpha-nvim
-- Config autor: Andr3xDev
---------------------------------------------------------------------------

return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    enabled = true,
    init = false,
    opts = function()
        local dashboard = require 'alpha.themes.dashboard'
        local logo = [[
    nvim
    ]]

        dashboard.section.header.val = vim.split(logo, '\n')
        dashboard.section.buttons.val = {
            dashboard.button('f', ' ' .. ' Find file', '<cmd> Telescope find_files <cr>'),
            dashboard.button('n', ' ' .. ' New file', '<cmd>ene <BAR> startinsert <cr>'),
            dashboard.button('s', ' ' .. ' Restore Session', [[<cmd> lua require("persistence").load() <cr>]]),
            dashboard.button('q', ' ' .. ' Quit', '<cmd> qa <cr>'),
        }
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = 'AlphaButtons'
            button.opts.hl_shortcut = 'AlphaShortcut'
        end

        dashboard.section.header.opts.hl = 'AlphaHeader'
        dashboard.section.buttons.opts.hl = 'AlphaButtons'
        dashboard.opts.layout[1].val = 8
        return dashboard
    end,

    config = function(_, dashboard)
        if vim.o.filetype == 'lazy' then
            vim.cmd.close()
            vim.api.nvim_create_autocmd('User', {
                once = true,
                pattern = 'AlphaReady',
                callback = function()
                    require('lazy').show()
                end,
            })
        end
        require('alpha').setup(dashboard.opts)
    end,
}
