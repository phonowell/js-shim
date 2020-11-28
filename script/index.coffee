# include ../source/index.ahk

class Map

  __data__: {}

  clear: -> @__data__ = {}

  get: (key) -> return @__data__[$.toString key]

  size: -> return $.length @__data__

  set: (key, value) ->
    @__data__[$.toString key] = value

a = new Map()
a.set 1, 22
alert a.get 1