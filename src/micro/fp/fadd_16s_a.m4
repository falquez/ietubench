define(`FP_FADD',     `  fadd s`$1', s30, s31
')
define(`KERNEL',      `forloop_arg(0,15,`FP_FADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
