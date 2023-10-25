define(`INT_UMULH_INT_EXTR',     `
umulh x`'eval(2*`$1'+2), x20, x21
extr  x`'eval(2*`$1'+3), x20, x21, #8
')
define(`KERNEL',      `forloop_arg(1,8,`INT_UMULH_INT_EXTR')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))

define(`KERNEL_INIT',      `
  mov x20, #128
  mov x21, #2
')
