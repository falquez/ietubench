define(`INT_MADD_INT_ADD',     `
madd x`'eval(2*`$1'+2), x20, x21, x22
add  x`'eval(2*`$1'+3), x20, x21
')
define(`KERNEL',      `forloop_arg(1,8,`INT_MADD_INT_ADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
