if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal suffixesadd+=.ts,.tsx
let b:ale_fixers = ['prettier', 'eslint']
