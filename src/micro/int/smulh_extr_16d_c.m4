define(`INT_SMULH_INT_EXTR',     `
smulh x`'eval(2*`$1'+4), x20, x21
extr  x4, x4, x5, #8
smulh x`'eval(2*`$1'+5), x20, x21
extr  x4, x4, x5, #8
')
define(`KERNEL',      `forloop_arg(1,4,`INT_SMULH_INT_EXTR')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))

define(`KERNEL_INIT',      `
  mov x20, #128
  mov x21, #2
')
