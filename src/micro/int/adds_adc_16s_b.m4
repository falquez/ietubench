define(`INT_ADDS_INT_ADC',     `
adds   w`'eval(2*`$1'+2), w`'eval(2*`$1'+2), w`'eval(2*`$1'+2)
adc    w`'eval(2*`$1'+3), w`'eval(2*`$1'+3), w`'eval(2*`$1'+3)
')
define(`KERNEL',      `forloop_arg(1,8,`INT_ADDS_INT_ADC')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
