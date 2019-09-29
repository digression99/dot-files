let current_compiler = "eslint"
let s:cpo_save = &cpo
set cpo-=C
CompilerSet makeprg=eslint\ $*\ 'src/**/*.ts'
CompilerSet errorformat=
    \%EERROR:\ %f[%l\\\,\ %c]:\ %m,
    \%WWARNING:\ %f[%l\\\,\ %c]:\ %m,
    \%E%f[%l\\\,\ %c]:\ %m
let &cpo = s:cpo_save
unlet s:cpo_save
