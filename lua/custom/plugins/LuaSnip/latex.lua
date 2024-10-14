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

ls.add_snippets('tex', {
  s('beg', {
    t { '\\begin{' },
    i(1),
    t { '}' },
    t { '', '\t' },
    i(2),
    t { '', '\\end{' },
    rep(1),
    t { '}' },
  }),
  s('mk', {
    t { '$' },
    i(1),
    t { '$' },
  }),
  s('doc', {
    t {
      '\\documentclass[a4paper, 12pt]{article}',
      '\\usepackage[margin=1in]{geometry}',
      '\\usepackage{amsmath}',
      '\\setlength{\\parindent}{0pt}',
      '\\usepackage{enumitem}',
      '\\usepackage{setspace}',
      '\\setlist{itemsep=0pt,parsep=0pt}',
      '',
      '\\begin{document}',
      '',
      '\\end{document}',
    },
  }),
  s('mm', {
    t { '\\[' },
    i(1),
    t { '\\]' },
  }),
  s('cm', {
    t { '\\texttt{' },
    i(1),
    t { '}' },
  }),
  s('ig', {
    t { '\\begin{center}', '  \\includegraphics[scale=' },
    i(1),
    t { ']{' },
    i(2),
    t { '}', '\\end{center}' },
  }),
  s('lb', {
    t { '\\textbf{' },
    i(1),
    t { '}' },
  }),
  s('it', {
    t { '\\textit{' },
    i(1),
    t { '}' },
  }),
  s('iz', {
    t { '\\begin{itemize}', '  \\item ' },
    i(1),
    t { '', '\\end{itemize}' },
  }),
})
