define(`INT1', `adc')
define(`KERNEL',      `forloop_arg(1,16,`KERNEL_INT32_A')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
