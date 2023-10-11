define(`INT_MUL_INT_ADDS',     `
mul  w`'eval(2*`$1'+2), w20, w21
adds w`'eval(2*`$1'+3), w20, w21
')
define(`KERNEL',      `forloop_arg(1,8,`INT_MUL_INT_ADDS')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
