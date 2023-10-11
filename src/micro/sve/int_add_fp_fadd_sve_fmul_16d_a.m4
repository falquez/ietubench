define(`INT_ADD',     `  add x`$1', x14, x15
')
define(`FP_FADD',     `  fadd d`$1', d28, d29
')
define(`SVE_FMUL',         `  fmul z`$1'.d, p0/m, z`$1'.d, z31.d
')
define(`KERNEL_T',    `FP_FADD(eval(`$1'+16))INT_ADD(eval(`$1'+4))SVE_FMUL(eval(`$1'+16))INT_ADD(eval(`$1'+8))')
define(`KERNEL',      `forloop_arg(0,3,`KERNEL_T')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
