define(`SVE_FMLA',    `  fmla z`$1'.d, p0/m, z30.d, z31.d
')
define(`KERNEL',      `forloop_arg(0,15,`SVE_FMLA')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
