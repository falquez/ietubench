define(`INT1', `adds')
define(`INT2', `adc')
define(`KERNEL',      `forloop_arg(1,8,`KERNEL_INT32_INT32_B')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
