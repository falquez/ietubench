define(`INT_SMULH_INT_ROR',     `
smulh x`'eval(2*`$1'+4), x20, x21
ror   x4, x5, #8
smulh x`'eval(2*`$1'+5), x20, x21
ror   x5, x4, #8
')
define(`KERNEL',      `forloop_arg(1,4,`INT_SMULH_INT_ROR')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
