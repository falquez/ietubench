define(`INT_ADD',     `  add x`$1', x`$1', x`$1'
')
define(`FP_FADD',     `  fadd d`$1', d`$1', d`$1'
')
define(`KERNEL_T',    `FP_FADD(eval(`$1'+16))INT_ADD(eval(`$1'+4))')
define(`KERNEL',      `forloop_arg(0,7,`KERNEL_T')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
