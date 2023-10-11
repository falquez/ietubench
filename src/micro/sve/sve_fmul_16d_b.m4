define(`SVE_FMUL',    `  fmul z`$1'.d, p0/m, z`$1'.d, z`$1'.d
')
define(`KERNEL',      `forloop_arg(0,15,`SVE_FMUL')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
