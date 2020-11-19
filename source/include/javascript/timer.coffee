# clearInterval(callback: Function): void
clearInterval = (callback) ->
  unless callback then return
  `SetTimer, % callback, Delete`

# clearTimeout(callback: Function): void
clearTimeout = (callback) ->
  unless callback then return
  `SetTimer, % callback, Delete`

# setInterval(callback: Function, time: number): string
setInterval = (callback, time) ->
  if ($.type callback) == 'function'
    callback = callback.Bind()
  `SetTimer, % callback, % time`
  return callback

# setTimeout(callback: Function, time: number): string
setTimeout = (callback, time) ->
  if ($.type callback) == 'function'
    callback = callback.Bind()
  `SetTimer, % callback, % 0 - time`
  return callback