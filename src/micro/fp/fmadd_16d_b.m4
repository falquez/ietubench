define(`FP_FMADD',     `  fmadd d`$1', d`$1', d`$1', d`$1'
')
define(`KERNEL',      `forloop_arg(0,15,`FP_FMADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
