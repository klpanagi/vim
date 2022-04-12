lua << EOF

local vim = vim
local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

require('pretty-fold').setup{
   keep_indentation = false,
   key = 'h',
   fill_char = '━',
   sections = {
      left = {
         '━ ', function() return string.rep('*', vim.v.foldlevel) end, ' ━┫', 'content', '┣'
      },
      right = {
         '┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
      }
   }
}

require('pretty-fold.preview').setup()

EOF

" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
