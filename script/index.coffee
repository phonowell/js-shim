# include ../source/index

$.on 'f1', $.throttle 1e3, -> $.info $.now()
$.on 'f2', $.debounce 2e3, -> $.info $.now()