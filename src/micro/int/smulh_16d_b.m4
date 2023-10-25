define(`INT1', `smulh')
define(`KERNEL',      `forloop_arg(1,16,`KERNEL_INT64_B')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
