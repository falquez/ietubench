define(`FP_FADD',          `  fadd d`$1', d28, d29
')
define(`SVE_FMLA',         `  fmla z`$1'.d, p0/m, z30.d, z31.d
')
define(`FP_FADD_SVE_FMLA', `FP_FADD(eval(`$1'+16))SVE_FMLA(eval(`$1'))')
define(`KERNEL',           `forloop_arg(0,7,`FP_FADD_SVE_FMLA')')
define(`KERNEL_REPS',      `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
