define(`INT_MUL_INT_SMULH',     `
mul   x`'eval(2*`$1'+2), x20, x21
smulh x`'eval(2*`$1'+3), x20, x21
')
define(`KERNEL',      `forloop_arg(1,8,`INT_MUL_INT_SMULH')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
