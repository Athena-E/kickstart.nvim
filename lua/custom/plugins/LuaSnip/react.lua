local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

-- Define a snippet for a React functional component
ls.add_snippets('javascript', {
  s(
    'rfc',
    fmt(
      [[
    import React from 'react';

    const {} = () => {{
      return (
        <div>
          {}
        </div>
      );
    }}

    export default {};
  ]],
      {
        i(1, 'ComponentName'),
        i(2, 'Content'),
        rep(1),
      }
    )
  ),
})

-- Optional: If you also want to use the snippet in TypeScript files
ls.add_snippets('typescriptreact', {
  s(
    'rfc',
    fmt(
      [[
    import React from 'react';

    const {}: React.FC = () => {{
      return (
        <div>
          {}
        </div>
      );
    }}

    export default {};
  ]],
      {
        i(1, 'ComponentName'),
        i(2, 'Content'),
        rep(1),
      }
    )
  ),
})
