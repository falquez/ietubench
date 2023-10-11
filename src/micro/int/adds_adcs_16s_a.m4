define(`INT_ADDS_INT_ADCS',     `
adds   w`'eval(2*`$1'+2), w20, w21
adcs   w`'eval(2*`$1'+3), w20, w21
')
define(`KERNEL',      `forloop_arg(1,8,`INT_ADDS_INT_ADCS')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
