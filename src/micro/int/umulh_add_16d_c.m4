define(`INT_UMULH_INT_ADD',     `
umulh x`$1', x20, x21
add   x4, x4, x5
')
define(`KERNEL',      `forloop_arg(7,14,`INT_UMULH_INT_ADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
