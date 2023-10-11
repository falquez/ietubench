define(`INT_ADD',     `  add x`$1', x`$1', x`$1'
')
define(`SVE_FMUL',    `  fmul z`$1'.d, p0/m, z`$1'.d, z`$1'.d
')
define(`KERNEL_T',    `SVE_FMUL(eval(`$1'+16))INT_ADD(eval(`$1'+4))')
define(`KERNEL',      `forloop_arg(0,7,`KERNEL_T')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
