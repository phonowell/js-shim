# include ../source/index.ahk

class A
  value: 1

fn = ->
  a = new A()
  a.value = 2
  return a

x = fn()
alert x.value