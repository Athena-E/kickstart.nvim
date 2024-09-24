-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      require('which-key').add {
        { '<leader>c', desc = '[C]ode', hidden = true },
        { '<leader>d', desc = '[D]ocument', hidden = true },
        { '<leader>r', desc = '[R]ename', hidden = true },
        { '<leader>s', desc = '[S]earch', hidden = true },
        { '<leader>w', desc = '[W]orkspace', hidden = true },
        { '<leader>t', desc = '[T]oggle', hidden = true },
        { '<leader>h', desc = 'Git [H]unk', hidden = true },
      }

      require('which-key').add {
        mode = { 'v' },
        { '<leader>h', desc = 'Git [H]unk' },
      }
    end,
  },
}
