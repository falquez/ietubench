define(`INT_ROR_INT_ADD',     `
  ror x`$1', x20, #8
  add x4, x4, x5
')
define(`KERNEL',      `forloop_arg(7,14,`INT_ROR_INT_ADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))

define(`KERNEL_INIT',      `
  mov x20, #128
  mov x21, #2
')