# include ../source/index.ahk

$.on 'f1', ->
  for i in [1, 2, 3, 4, 5]
    setTimeout alert.Bind(i), i * 1e3