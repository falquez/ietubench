define(`INT_ROR',     `
  ror x`$1', x20, #8
')
define(`KERNEL',      `forloop_arg(4,19,`INT_ROR')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))

define(`KERNEL_INIT',      `
  mov x20, #128
  mov x21, #2
')