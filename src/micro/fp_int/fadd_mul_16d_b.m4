define(`FP_FADD_INT_MUL',     `
  fadd d`'eval(2*`$1'+10), d28, d29
  mul  x`'eval(2*`$1'+0),  x14, x15
  fadd d`'eval(2*`$1'+11), d28, d29
  mul  x`'eval(2*`$1'+1),  x14, x15
')
define(`KERNEL',      `forloop_arg(3,6,`FP_FADD_INT_MUL')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
