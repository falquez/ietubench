define(`FP_FADD',          `  fadd d`$1', d28, d29
')
define(`SVE_FMUL',         `  fmul z`$1'.d, p0/m, z`$1'.d, z31.d
')
define(`FP_FADD_SVE_FMUL', `FP_FADD(eval(`$1'+16))SVE_FMUL(eval(`$1'+16))')
define(`KERNEL',           `forloop_arg(0,7,`FP_FADD_SVE_FMUL')')
define(`KERNEL_REPS',      `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
