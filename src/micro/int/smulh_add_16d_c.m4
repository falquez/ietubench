define(`INT1', `smulh')
define(`INT2', `add')
define(`KERNEL',      `forloop_arg(1,4,`KERNEL_INT64_INT64_C')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))