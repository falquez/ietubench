define(`INT_UMULH_INT_ADD',     `
  umulh x`'eval(8*`$1'-4), x20, x21
  umulh x`'eval(8*`$1'-3), x20, x21
  umulh x`'eval(8*`$1'-2), x20, x21
  umulh x`'eval(8*`$1'-1), x20, x21
  umulh x`'eval(8*`$1'+0), x20, x21
  umulh x`'eval(8*`$1'+1), x20, x21
  umulh x`'eval(8*`$1'+2), x20, x21
  add   x`'eval(8*`$1'+3), x20, x21
')
define(`KERNEL',      `forloop_arg(1,2,`INT_UMULH_INT_ADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
