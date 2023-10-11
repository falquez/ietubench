define(`FP_FADD',     `  fadd d`$1', d30, d31
')
define(`KERNEL',      `forloop_arg(0,15,`FP_FADD')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
