define(`FP_FMADD',     `  fmadd d`$1', d29, d30, d31
')
define(`KERNEL',      `forloop_arg(0,15,`FP_FMADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
