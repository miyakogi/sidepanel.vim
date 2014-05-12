scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

let s:V = vital#of('sidepanel')
let s:List = s:V.import('Data.List')
let s:BaseLine = 4

function! sidepanel#list#open()
  if sidepanel#util#gotowin("__SidePanel_List__") == 0
    call sidepanel#util#open("__SidePanel_List__")
    let &swapfile = 0
    let &buftype = 'nofile'
    let &modifiable = 1
    let &readonly = 0
    setlocal nowrap
    call s:clear()
    call s:create()
    nnoremap <buffer><silent><nowait> <CR> :<C-u>call <SID>cr()<CR>
    nnoremap <buffer><silent><nowait> <Up> :<C-u>call <SID>up()<CR>
    nnoremap <buffer><silent><nowait> k :<C-u>call <SID>up()<CR>
    nnoremap <buffer><silent><nowait> <Down> :<C-u>call <SID>down()<CR>
    nnoremap <buffer><silent><nowait> j :<C-u>call <SID>down()<CR>
    let &modified = 0
    let &modifiable = 0
    let &readonly = 1
  endif
endfunction

function! sidepanel#list#close()
  call sidepanel#util#close("__SidePanel_List__")
endfunction

function! s:clear()
  execute "%delete"
endfunction

function! s:create()
  let s:panelnames = []
  for l:name in keys(g:sidepanel_config)
    call add(s:panelnames, l:name)
  endfor
  call uniq(sort(s:panelnames))
  let a:num = 0

  call append(0, s:title())
  call append(0, '')
  for l:name in s:panelnames
    call append(line("$"), "   " . l:name)
    call cursor(s:BaseLine, 4)
  endfor
endfunction

function! s:title()
  if exists('g:sidepanel_width')
    let s:title_width = g:sidepanel_width  / 2
    let s:title_space = s:title_width - 7
    let s:space = ''
    for num in range(s:title_space)
      let s:space = s:space . '-'
    endfor
    let s:title = s:space . ' SidePanel ' . s:space
    let s:margin = ''
    return s:title
endfunction

function s:cr()
  let l:line = getline('.')
  let l:line = substitute(l:line, '^\s\+', '', "")
  execute "SidePanel " . l:line
endfunction

function s:up()
  let l:line = line('.') - s:BaseLine +1
  let l:len = len(s:panelnames)
  if l:line <= 1
    call cursor(l:len + s:BaseLine - 1, 0)
  else
    call cursor(l:line + s:BaseLine -2, 0)
  endif
endfunction

function s:down()
  let l:line = line('.') - s:BaseLine + 1
  let l:len = len(s:panelnames)
  if l:line >= l:len
    call cursor(s:BaseLine, 0)
  else
    call cursor(l:line + s:BaseLine, 0)
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
