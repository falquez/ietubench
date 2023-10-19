define(`FP_FADD_INT_ADCS',     `
  fadd d`'eval(2*`$1'+10), d`'eval(2*`$1'+10), d`'eval(2*`$1'+10)
  adcs x`'eval(2*`$1'+0),  x`'eval(2*`$1'+0),  x`'eval(2*`$1'+0)
  fadd d`'eval(2*`$1'+11), d`'eval(2*`$1'+11), d`'eval(2*`$1'+11)
  adcs x`'eval(2*`$1'+1),  x`'eval(2*`$1'+1),  x`'eval(2*`$1'+1)
')
define(`KERNEL',      `forloop_arg(3,6,`FP_FADD_INT_ADCS')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
