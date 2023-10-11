define(`INT_MUL_INT_ADCS_INT_UMULH_INT_ADCS',     `
mul   x`'eval(4*`$1'+0), x`'eval(4*`$1'+0), x`'eval(4*`$1'+0)
adcs  x`'eval(4*`$1'+1), x`'eval(4*`$1'+1), x`'eval(4*`$1'+1)
umulh x`'eval(4*`$1'+2), x`'eval(4*`$1'+2), x`'eval(4*`$1'+2)
adcs  x`'eval(4*`$1'+3), x`'eval(4*`$1'+3), x`'eval(4*`$1'+3)
')
define(`KERNEL',      `forloop_arg(1,4,`INT_MUL_INT_ADCS_INT_UMULH_INT_ADCS')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
