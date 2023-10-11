define(`INT_MUL_INT_ADD',     `
mul x`'eval(2*`$1'+2), x`'eval(2*`$1'+2), x`'eval(2*`$1'+2)
add x`'eval(2*`$1'+3), x`'eval(2*`$1'+3), x`'eval(2*`$1'+3)
')
define(`KERNEL',      `forloop_arg(1,8,`INT_MUL_INT_ADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
