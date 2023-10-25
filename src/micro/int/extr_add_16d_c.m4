define(`INT_EXTR_INT_ADD',     `
  extr x`'eval(`$1'+5), x20, x21, #8
  add  x4, x4, x5
')
define(`KERNEL',      `forloop_arg(1,8,`INT_EXTR_INT_ADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))

define(`KERNEL_INIT',      `
  mov x20, #128
  mov x21, #2
')