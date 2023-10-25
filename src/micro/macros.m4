divert(`-1')
changecom(`/*', `*/')
/* forloop_arg(from, to, macro) - invoke MACRO(value) for  */
/* each value between FROM and TO, without define overhead */
define(`forloop_arg', `ifelse(eval(`($1) <= ($2)'), `1',
  `_forloop(`$1', eval(`$2'), `$3(', `)')')')
/* forloop(var, from, to, stmt) - refactored to share code */
define(`forloop', `ifelse(eval(`($2) <= ($3)'), `1',
  `pushdef(`$1')_forloop(eval(`$2'), eval(`$3'),
    `define(`$1',', `)$4')popdef(`$1')')')
define(`_forloop',
  `$3`$1'$4`'ifelse(`$1', `$2', `',
    `$0(incr(`$1'), `$2', `$3', `$4')')')
divert`'dnl
divert(`-1')
define(`KERNEL_BASENAME', `patsubst(substr(`$1',`8',eval(len(`$1')-`11')),`\w+/',`')')
define(`PROLOGUE', `')
define(`EPILOGUE', `')
define(`KERNEL_INIT', `
')
define(`KERNEL_BODY', `
KERNEL_NAME`'_loop:
forloop_arg(1,KERNEL_REPS,`KERNEL')

  sub x0, x0, #1
  cbnz x0, KERNEL_NAME`'_loop

')
define(`KERNEL_INT64_A',     `
  INT1 x`'eval(`$1'+3), x20, x21
')
define(`KERNEL_INT64_B',     `
  INT1 x`'eval(`$1'+3), x`'eval(`$1'+3), x`'eval(`$1'+3)
')
define(`KERNEL_INT64_4_A',     `
  INT1 x`'eval(`$1'+3), x20, x21, x22
')
define(`KERNEL_INT64_4_B',     `
  INT1 x`'eval(`$1'+3), x`'eval(`$1'+3), x`'eval(`$1'+3), x`'eval(`$1'+3)
')
define(`KERNEL_INT64_INT64_A',     `
  INT1 x`'eval(2*`$1'+2), x20, x21
  INT2 x`'eval(2*`$1'+3), x20, x21
')
define(`KERNEL_INT64_4_INT64_A',     `
  INT1 x`'eval(2*`$1'+2), x20, x21, x22
  INT2 x`'eval(2*`$1'+3), x20, x21
')
define(`KERNEL_INT64_INT64_4_A',     `
  INT1 x`'eval(2*`$1'+2), x20, x21
  INT2 x`'eval(2*`$1'+3), x20, x21, x22
')
define(`KERNEL_INT64_INT64_B',     `
  INT1 x`'eval(2*`$1'+2), x`'eval(2*`$1'+2), x`'eval(2*`$1'+2)
  INT2 x`'eval(2*`$1'+3), x`'eval(2*`$1'+3), x`'eval(2*`$1'+3)
')
define(`KERNEL_INT64_4_INT64_B',     `
  INT1 x`'eval(2*`$1'+2), x`'eval(2*`$1'+2), x`'eval(2*`$1'+2), x`'eval(2*`$1'+2)
  INT2 x`'eval(2*`$1'+3), x`'eval(2*`$1'+3), x`'eval(2*`$1'+3)
')
define(`KERNEL_INT64_INT64_C',     `
  INT1 x`'eval(2*`$1'+4), x20, x21
  INT2 x4, x4, x5
  INT1 x`'eval(2*`$1'+5), x20, x21
  INT2 x4, x4, x5
')
define(`KERNEL_INT64_4_INT64_C',     `
  INT1 x`'eval(2*`$1'+4), x20, x21, x22
  INT2 x4, x4, x5
  INT1 x`'eval(2*`$1'+5), x20, x21, x22
  INT2 x4, x4, x5
')
define(`KERNEL_INT64_INT64_4_C',     `
  INT1 x`'eval(2*`$1'+4), x20, x21
  INT2 x4, x5, x22, x4
  INT1 x`'eval(2*`$1'+5), x20, x21
  INT2 x4, x5, x22, x4
')
define(`KERNEL_INT64_INT64_INT64_INT64_A',     `
  INT1 x`'eval(4*`$1'+0), x20, x21
  INT2 x`'eval(4*`$1'+1), x20, x21
  INT3 x`'eval(4*`$1'+2), x20, x21
  INT4 x`'eval(4*`$1'+3), x20, x21
')
define(`KERNEL_INT64_INT64_INT64_INT64_B',     `
  INT1 x`'eval(4*`$1'+0), x`'eval(4*`$1'+0), x`'eval(4*`$1'+0)
  INT2 x`'eval(4*`$1'+1), x`'eval(4*`$1'+1), x`'eval(4*`$1'+1)
  INT3 x`'eval(4*`$1'+2), x`'eval(4*`$1'+2), x`'eval(4*`$1'+2)
  INT4 x`'eval(4*`$1'+3), x`'eval(4*`$1'+3), x`'eval(4*`$1'+3)
')
define(`KERNEL_INT64_INT64_INT64_INT64_C',     `
  INT1 x`'eval(2*`$1'+4), x20, x21
  INT2 x4, x4, x5
  INT3 x`'eval(2*`$1'+5), x20, x21
  INT4 x4, x4, x5
')
define(`KERNEL_INT64_FP64_INT64_FP64_A',     `
  INT1 x`'eval(2*`$1'+4),  x14, x15
  FP1  d`'eval(2*`$1'+14), d28, d29
  INT2 x`'eval(2*`$1'+5),  x14, x15
  FP2  d`'eval(2*`$1'+15), d28, d29
')
define(`KERNEL_INT64_FP64_INT64_FP64_B',     `
  INT1 x`'eval(2*`$1'+4),  x`'eval(2*`$1'+4),  x`'eval(2*`$1'+4)
  FP1  d`'eval(2*`$1'+14), d`'eval(2*`$1'+14), d`'eval(2*`$1'+14)
  INT2 x`'eval(2*`$1'+5),  x`'eval(2*`$1'+5),  x`'eval(2*`$1'+5)
  FP2  d`'eval(2*`$1'+15), d`'eval(2*`$1'+15), d`'eval(2*`$1'+15)
')
define(`KERNEL_INT64_FP64_INT64_FP64_C',     `
  INT1 x`'eval(4*`$1'+2), x20, x21
  FP1  d4, d4, d5
  INT2 x`'eval(4*`$1'+3), x20, x21
  FP2  d4, d4, d5
')
define(`KERNEL_INT32_A',     `
  INT1 w`'eval(`$1'+3), w20, w21
')
define(`KERNEL_INT32_B',     `
  INT1 w`'eval(`$1'+3), w`'eval(`$1'+3), w`'eval(`$1'+3)
')
define(`KERNEL_INT32_4_A',     `
  INT1 w`'eval(`$1'+3), w20, w21, w22
')
define(`KERNEL_INT32_4_B',     `
  INT1 w`'eval(`$1'+3), w`'eval(`$1'+3), w`'eval(`$1'+3), w`'eval(`$1'+3)
')
define(`KERNEL_INT32_INT32_A',     `
  INT1 w`'eval(2*`$1'+2), w20, w21
  INT2 w`'eval(2*`$1'+3), w20, w21
')
define(`KERNEL_INT32_INT32_B',     `
  INT1 w`'eval(2*`$1'+2), w`'eval(2*`$1'+2), w`'eval(2*`$1'+2)
  INT2 w`'eval(2*`$1'+3), w`'eval(2*`$1'+2), w`'eval(2*`$1'+2)
')
divert`'dnl
