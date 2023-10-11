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
divert`'dnl
