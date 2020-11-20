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

  __type__ = $.type time
  unless __type__ == 'number'
    throw new Error "setTimeout: invalid time type '#{__type__}'"
  unless time > 0
    throw new Error "setTimeout: invalid time value '#{time}'"

  `SetTimer, % callback, % time`
  return callback

# setTimeout(callback: Function, time: number): string
setTimeout = (callback, time) ->

  if ($.type callback) == 'function'
    callback = callback.Bind()

  __type__ = $.type time
  unless __type__ == 'number'
    throw new Error "setTimeout: invalid time type '#{__type__}'"

  if time == 0 then time++

  unless time > 0
    throw new Error "setTimeout: invalid time value '#{time}'"

  `SetTimer, % callback, % 0 - time`
  return callback