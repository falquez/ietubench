define(`INT_UMULH_INT_ADCS',     `
umulh x`'eval(2*`$1'+2), x20, x21
adcs  x`'eval(2*`$1'+3), x20, x21
')
define(`KERNEL',      `forloop_arg(1,8,`INT_UMULH_INT_ADCS')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
