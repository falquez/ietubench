define(`INT_MADD',     `  madd w`$1', w`$1', w`$1', w`$1'
')
define(`KERNEL',      `forloop_arg(4,19,`INT_MADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))