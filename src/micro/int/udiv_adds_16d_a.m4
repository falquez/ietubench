define(`INT_UDIV_INT_ADDS',     `
  udiv x`'eval(2*`$1'+2), x20, x21
  adds x`'eval(2*`$1'+3), x20, x21
')
define(`KERNEL',      `forloop_arg(1,8,`INT_UDIV_INT_ADDS')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))

define(`KERNEL_INIT',      `
  mov x20, #128
  mov x21, #2
')