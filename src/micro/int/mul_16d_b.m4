define(`INT_MUL',     `  mul x`$1', x`$1', x`$1'
')
define(`KERNEL',      `forloop_arg(4,19,`INT_MUL')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
