define(`INT1', `umulh')
define(`INT2', `madd')
define(`KERNEL',      `forloop_arg(1,4,`KERNEL_INT64_INT64_4_A')')
define(`KERNEL_REPS', `eval(REPS/16)')
define(`KERNEL_NAME', KERNEL_BASENAME(__file__)`_'eval(REPS))