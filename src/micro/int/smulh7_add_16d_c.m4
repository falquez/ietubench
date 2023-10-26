define(`INT_SMULH_INT_ADD',     `
  smulh x`'eval(7*`$1'-1), x20, x21
  smulh x`'eval(7*`$1'+0), x20, x21
  smulh x`'eval(7*`$1'+1), x20, x21
  smulh x`'eval(7*`$1'+2), x20, x21
  smulh x`'eval(7*`$1'+3), x20, x21
  smulh x`'eval(7*`$1'+4), x20, x21
  smulh x`'eval(7*`$1'+5), x20, x21
  add x4, x4, x5
')
define(`KERNEL',      `forloop_arg(1,2,`INT_SMULH_INT_ADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
