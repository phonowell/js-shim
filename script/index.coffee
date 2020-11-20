# include ../source/index

count = 0

# function

doAs = (callback, limit = 1, interval = 100, delay = 0) ->

  if delay
    $.delay delay, (
      callback = callback
      limit = limit
      interval = interval
    ) -> doAs callback, limit, interval, 0
    return

  n = 1
  while n <= limit
    delay = (n - 1) * interval
    setTimeout (
      n = n
      callback = callback
    ) ->
      callback n
    , delay
    n++

# binding

$.on '1', ->

  $.press key

  doAs ->
    $.press 'e'
  , 2, 100, 100


$.on '2', ->
  n = 2
  callback = (n) -> $.info n

  $.delay (n - 1) * 100, (
    n = n
    callback = callback
  ) -> callback n

$.on '4', $.exit