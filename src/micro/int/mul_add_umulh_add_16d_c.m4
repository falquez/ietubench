define(`INT_MUL_INT_ADD_INT_UMULH_INT_ADD',     `
mul    x`'eval(2*`$1'+2), x20, x21
add    x4, x4, x5
umulh  x`'eval(2*`$1'+3), x20, x21
add    x4, x4, x5
')
define(`KERNEL',      `forloop_arg(2,5,`INT_MUL_INT_ADD_INT_UMULH_INT_ADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
