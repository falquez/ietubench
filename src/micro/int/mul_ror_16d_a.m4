define(`INT_MUL_INT_ROR',     `
mul  x`'eval(2*`$1'+2), x20, x21
ror  x`'eval(2*`$1'+3), x20, #8
')
define(`KERNEL',      `forloop_arg(1,8,`INT_MUL_INT_ROR')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
