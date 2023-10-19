define(`FP_FADD_INT_ADD',     `
  fadd d`'eval(2*`$1'+0), d28, d29
  add x4, x4, x5
  fadd d`'eval(2*`$1'+1), d28, d29
  add x4, x4, x5
')
define(`KERNEL',      `forloop_arg(8,11,`FP_FADD_INT_ADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
