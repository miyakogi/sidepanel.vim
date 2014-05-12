scriptencoding utf-8

let s:save_cpo = &cpo
set cpo&vim

function! sidepanel#test#initialize()
  execute 'e ~/test/1'
  execute 'sp ~/test/2'
  execute 'sp ~/test/3'
  execute 'wincmd k'
  if bufname("") != 2
    echo 'ERROR initialise'
  endif
endfunction

function! sidepanel#test#open(name)
  execute 'SidePanel ' . a:name
endfunction

function! sidepanel#test#postoggle()
  execute 'SidePanelPosToggle'
  if bufname("") != 2
    echo 'ERROR postoggle'
  endif
endfunction

function! sidepanel#test#change_width()
  execute 'SidePanelWidth 10'
  if bufname("") != 2
    echo 'ERROR change_width'
  endif
endfunction

function! sidepanel#test#test(name)
  " if !exists('g:sidepanel_test_initialized')
    call sidepanel#test#initialize()
  "   let g:sidepanel_test_initialized = 1
  " endif
  call sidepanel#test#open(a:name)
  execute 'wincmd l'
  execute 'wincmd j'
  if bufname("") != 2
    echo 'ERROR ' . a:name
  endif
  " call sidepanel#test#postoggle()
  " call sidepanel#test#change_width()
endfunction

function! sidepanel#test#all()
  let names = keys(g:sidepanel_config)
  let g:err = []
  for name in names
    new
    only
    echo ""
    echo "==== Start " . name " ===="
    call sidepanel#test#test(name)
  endfor
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
