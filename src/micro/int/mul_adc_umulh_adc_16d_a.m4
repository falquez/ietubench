define(`INT1', `mul')
define(`INT2', `adc')
define(`INT3', `umulh')
define(`INT4', `adc')
define(`KERNEL',      `forloop_arg(1,4,`KERNEL_INT64_INT64_INT64_INT64_A')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))
