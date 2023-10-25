define(`INT_EXTR',     `
  extr x`'eval(`$1'+3), x20, x21, #8
')
define(`KERNEL',      `forloop_arg(1,16,`INT_EXTR')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))

define(`KERNEL_INIT',      `
  mov x20, #128
  mov x21, #2
')
