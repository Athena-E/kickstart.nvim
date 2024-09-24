-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    require('nvim-autopairs').setup {}
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

    local npairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'

    npairs.setup {}

    -- autofill end pair
    npairs.add_rules {
      Rule('\\begin{', '\\end{', { 'latex', 'tex' })
        :use_regex(false)
        :with_pair(function(opts)
          local _, _, env = string.find(opts.line, '\\begin{([^}]*)}')
          if env then
            return string.format('\\end{%s}', env)
          end
        end)
        :replace_endpair(function(opts)
          return string.format('}{%s}', opts.prev_char)
        end)
        :end_wise(),
    }
  end,
}
