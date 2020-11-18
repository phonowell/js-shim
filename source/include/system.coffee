# delay(time: number, callback: Function): string
$.delay = (time, callback) ->
  __timer__ = setTimeout callback, time
  return __timer__

# exit(): void
$.exit = -> ExitApp

# off(key: string, callback: Function): void
$.off = (key, callback) ->
  key = $.formatHotkey key
  `Hotkey, % key, % callback, Off`

# on(key, string, callback: Function): void
$.on = (key, callback) ->
  key = $.formatHotkey key
  `Hotkey, % key, % callback, On`

# open(source: string): void
$.open = (source) -> `Run, % source`

# reload(): void
$.reload = -> Reload

# sleep(time: number): void
$.sleep = (time) -> `Sleep, % time`

# suspend(suspended?: boolean): void
$.suspend = (isSuspended = 'Toggle') ->
  if isSuspended != 'Toggle'
    if isSuspended then isSuspended = 'On'
    else isSuspended = 'Off'
  `Suspend, % isSuspended`