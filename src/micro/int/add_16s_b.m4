define(`INT_ADD',     `  add w`$1', w`$1', w`$1'
')
define(`KERNEL',      `forloop_arg(4,19,`INT_ADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
