define(`INT_MADD_INT_ADCS',     `
madd x`'eval(2*`$1'+2), x`'eval(2*`$1'+2), x`'eval(2*`$1'+2), x`'eval(2*`$1'+2)
adcs x`'eval(2*`$1'+3), x`'eval(2*`$1'+3), x`'eval(2*`$1'+3)
')
define(`KERNEL',      `forloop_arg(1,8,`INT_MADD_INT_ADCS')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))