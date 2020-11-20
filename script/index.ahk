global $ := {}
$.reverse := Func("z_52") ; reverse(input: unknown[]): unknown[]
$.includes := Func("z_51")
$.length := Func("z_50") ; length(input: string | array | object): number
$.type := Func("z_49") ; type(input: unknown): 'array' | 'function' | 'number' | 'object' | 'string'
$.findColor := Func("z_48") ; findColor( color: number, start: Point = [0, 0], end: Point = [A_ScreenWidth, A_ScreenHeight], variation = 0 ): Point
$.findImage := Func("z_47") ; findImage( source: string, start: Point = [0, 0], end: Point = [A_ScreenWidth, A_ScreenHeight], ): Point
$.getColor := Func("z_46") ; getColor(point?: Point): number
$.getPosition := Func("z_45") ; getPosition(): Point
$.getState := Func("z_44") ; getState(key: string): string
$.formatHotkey := Func("z_43") ; formatHotkey(key: string): string
$.now := Func("z_42") ; now(): number
$.random := Func("z_41") ; random(min: number = 0, max: number = 1): number
$.click := Func("z_40") ; click(key?: string): void
$.move := Func("z_39") ; move(point: Point, speed: number = 0): void
$.press := Func("z_38") ; press(key...: string): void
$.setFixed := Func("z_37") ; setFixed(fixed?: boolean): void
$.beep := Func("z_36") ; beep(): void
$.i := Func("z_35") ; i(message: string): string
$.info := Func("z_34") ; info(message: string, point?: Point): string
$.replace := Func("z_33") ; replace( input: string, searchment: string, replacement: string, limit: number = -1 )
$.split := Func("z_32") ; split(input: string, delimiter: string): string
$.toLowerCase := Func("z_31") ; toLowerCase(input: string): string
$.toString := Func("z_30") ; toString(input: unknown): string
$.toUpperCase := Func("z_29") ; toUpperCase(input: string): string
$.trim := Func("z_28") ; trim(input: string, omitting: string): string
$.trimEnd := Func("z_27") ; trimEnd(input: string, omitting: string): string
$.trimStart := Func("z_26") ; trimStart(input: string, omitting: string): string
$.delay := Func("z_25") ; delay(time: number, callback: Function): string
$.exit := Func("z_24") ; exit(): void
$.off := Func("z_23") ; off(key: string, callback: Function): void
$.on := Func("z_22") ; on(key, string, callback: Function): void
$.open := Func("z_21") ; open(source: string): void
$.reload := Func("z_20") ; reload(): void
$.sleep := Func("z_19") ; sleep(time: number): void
$.suspend := Func("z_18") ; suspend(suspended?: boolean): void
global Math := {abs: Func("z_17"), ceil: Func("z_16"), floor: Func("z_15"), round: Func("z_14")} ; abs(n: number): number ceil(n: number): number floor(n: number): number round(n: number): number
global alert := Func("z_13") ; alert(message: string): string
global clearInterval := Func("z_12") ; clearInterval(callback: Function): void
global clearTimeout := Func("z_11") ; clearTimeout(callback: Function): void
global setInterval := Func("z_10") ; setInterval(callback: Function, time: number): string
global setTimeout := Func("z_9") ; setTimeout(callback: Function, time: number): string
global count := 0
global doAs := Func("z_8") ; function
$.on.Call("1", Func("z_5")) ; binding
$.on.Call("2", Func("z_3"))
$.on.Call("4", $.exit)
z_1(n, callback) {
  callback.Call(n)
}
z_2(n) {
  $.info.Call(n)
}
z_3() {
  n := 2
  callback := Func("z_2")
  $.delay.Call((n - 1) * 100, Func("z_1").Bind(n, callback))
}
z_4() {
  $.press.Call("e")
}
z_5() {
  $.press.Call(key)
  doAs.Call(Func("z_4"), 2, 100, 100)
}
z_6(n, callback) {
  callback.Call(n)
}
z_7(callback, limit, interval) {
  doAs.Call(callback, limit, interval, 0)
}
z_8(callback, limit := 1, interval := 100, delay := 0) {
  if (delay) {
    $.delay.Call(delay, Func("z_7").Bind(callback, limit, interval))
    return
  }
  n := 1
  while (n <= limit) {
    delay := (n - 1) * interval
    setTimeout.Call(Func("z_6").Bind(n, callback), delay)
    n++
  }
}
z_9(callback, time) {
  if (($.type.Call(callback)) == "function") {
    callback := callback.Bind()
  }
  __type__ := $.type.Call(time)
  if !(__type__ == "number") {
    throw Exception("setTimeout: invalid time type '" . (__type__) . "'")
  }
  if (time == 0) {
    time++
  }
  if !(time > 0) {
    throw Exception("setTimeout: invalid time value '" . (time) . "'")
  }
  SetTimer, % callback, % 0 - time
  return callback
}
z_10(callback, time) {
  if (($.type.Call(callback)) == "function") {
    callback := callback.Bind()
  }
  __type__ := $.type.Call(time)
  if !(__type__ == "number") {
    throw Exception("setTimeout: invalid time type '" . (__type__) . "'")
  }
  if !(time > 0) {
    throw Exception("setTimeout: invalid time value '" . (time) . "'")
  }
  SetTimer, % callback, % time
  return callback
}
z_11(callback) {
  if !(callback) {
    return
  }
  SetTimer, % callback, Delete
}
z_12(callback) {
  if !(callback) {
    return
  }
  SetTimer, % callback, Delete
}
z_13(message := "") {
  if !(message) {
    return
  }
  _msg := $.toString.Call(message)
  MsgBox, % _msg
  return message
}
z_14(n) {
  return Round(n)
}
z_15(n) {
  return Floor(n)
}
z_16(n) {
  return Ceil(n)
}
z_17(n) {
  return Abs(n)
}
z_18(isSuspended := "Toggle") {
  if (isSuspended != "Toggle") {
    if (isSuspended) {
      isSuspended := "On"
    } else {
      isSuspended := "Off"
    }
  }
  Suspend, % isSuspended
}
z_19(time) {
  Sleep, % time
}
z_20() {
  Reload
}
z_21(source) {
  Run, % source
}
z_22(key, callback) {
  key := $.formatHotkey.Call(key)
  Hotkey, % key, % callback, On
}
z_23(key, callback) {
  key := $.formatHotkey.Call(key)
  Hotkey, % key, % callback, Off
}
z_24() {
  ExitApp
}
z_25(time, callback) {
  __timer__ := setTimeout.Call(callback, time)
  return __timer__
}
z_26(input, omitting := " `t") {
  return LTrim(input, omitting)
}
z_27(input, omitting := " `t") {
  return RTrim(input, omitting)
}
z_28(input, omitting := " `t") {
  return Trim(input, omitting)
}
z_29(input) {
  StringUpper, __Result__, input
  return __Result__
}
z_30(input) {
  _type := $.type.Call(input)
  if (_type == "array") {
    _result := ""
    for __i__, key in input {
      _result := "" . (_result) . ", " . ($.toString.Call(key)) . ""
    }
    return "[" . ($.trim.Call(_result, " ,")) . "]"
  } else if (_type == "object") {
    _result := ""
    for key, value in input {
      _result := "" . (_result) . ", " . (key) . ": " . ($.toString.Call(value)) . ""
    }
    return "{" . ($.trim.Call(_result, " ,")) . "}"
  }
  return input
}
z_31(input) {
  StringLower, __Result__, input
  return __Result__
}
z_32(input, delimiter) {
  return StrSplit(input, delimiter)
}
z_33(input, searchment, replacement, limit := -1) {
  return StrReplace(input, searchment, replacement, limit)
}
z_34(message, point := "") {
  if !(message) {
    return message
  }
  if !(point) {
    point := $.getPosition.Call()
  }
  _msg := $.toString.Call(message)
  ToolTip, % _msg, % point[1], % point[2]
  return message
}
z_35(message) {
  $.info.Call("" . ($.now.Call()) . " " . ($.toString.Call(message)) . "")
  return message
}
z_36() {
  SoundBeep
}
z_37(isFixed := "Toggle") {
  if (isFixed != "Toggle") {
    if (isFixed) {
      isFixed := "On"
    } else {
      isFixed := "Off"
    }
  }
  Winset AlwaysOnTop, % isFixed, A
}
z_38(listInput*) {
  if !($.length.Call(listInput)) {
    throw Exception("$.press: invalid key")
  }
  _listKey := []
  for __i__, input in listInput {
    _input := $.toLowerCase.Call(input)
    _input := $.replace.Call(_input, " ", "")
    _input := $.replace.Call(_input, "-", "")
    _list := $.split.Call(_input, "+")
    for __i__, it in _list {
      _listKey.Push(it)
    }
  }
  _listResult := []
  _len := $.length.Call(_listKey)
  for i, key in _listKey {
    if (i == _len) {
      _listResult[i] := $.split.Call(key, ":")
      continue
    }
    if ($.includes.Call(key, ":")) {
      _listResult[i] := $.split.Call(key, ":")
      _listResult[_len * 2 - i] := $.split.Call(key, ":")
    } else {
      _listResult[i] := [key, "down"]
      _listResult[_len * 2 - i] := [key, "up"]
    }
  }
  for i, it in _listResult {
    if (it[1] == "win") {
      it[1] := "lwin"
    }
    _listResult[i] := $.trim.Call("" . (it[1]) . " " . (it[2]) . "")
  }
  _output := ""
  for __i__, it in _listResult {
    _output := "" . (_output) . "{" . (it) . "}"
  }
  Send, % _output
}
z_39(point := "", speed := 0) {
  if !(point) {
    throw Exception("$.move: invalid point")
  }
  MouseMove, point[1], point[2], speed
}
z_40(key := "left") {
  key := $.replace.Call(key, "-", "")
  key := $.replace.Call(key, ":", " ")
  Click, % key
}
z_41(min := 0, max := 1) {
  Random, __Result__, min, max
  return __Result__
}
z_42() {
  return A_TickCount
}
z_43(key) {
  _listKey := []
  _key := $.toLowerCase.Call(key)
  _key := $.replace.Call(_key, " ", "")
  _key := $.replace.Call(_key, "-", "")
  _list := $.split.Call(_key, "+")
  for __i__, it in _list {
    _listKey.Push(it)
  }
  _isAlt := false
  _isCtrl := false
  _isShift := false
  _isWin := false
  _listResult := []
  for __i__, key in _listKey {
    if (key == "alt") {
      _isAlt := true
      continue
    }
    if (key == "ctrl") {
      _isCtrl := true
      continue
    }
    if (key == "shift") {
      _isShift := true
      continue
    }
    if (key == "win") {
      _isWin := true
      continue
    }
    _listResult.Push(key)
  }
  _prefix := ""
  if (_isAlt) {
    _prefix := "" . (_prefix) . "!"
  }
  if (_isCtrl) {
    _prefix := "" . (_prefix) . "^"
  }
  if (_isShift) {
    _prefix := "" . (_prefix) . "+"
  }
  if (_isWin) {
    _prefix := "" . (_prefix) . "#"
  }
  _result := ""
  for __i__, it in _listResult {
    _result := "" . (_result) . " & " . (it) . ""
  }
  return $.replace.Call("" . (_prefix) . "" . ($.trim.Call(_result, " &")) . "", ":", " ")
}
z_44(key) {
  return GetKeyState(key)
}
z_45() {
  MouseGetPos, __X__, __Y__
  return [__X__, __Y__]
}
z_46(point := "") {
  if !(point) {
    point := $.getPosition.Call()
  }
  PixelGetColor, __Result__, % point[1], % point[2], RGB
  return __Result__
}
z_47(source, start := "", end := "") {
  if !(start) {
    start := [0, 0]
  }
  if !(end) {
    end := [A_ScreenWidth, A_ScreenHeight]
  }
  ImageSearch __x__, __Y__, start[1], start[2], end[1], end[2], % A_ScriptDir . "\\\" . source
  return [__X__, __Y__]
}
z_48(color, start := "", end := "", variation := 0) {
  if !(start) {
    start := [0, 0]
  }
  if !(end) {
    end := [A_ScreenWidth, A_ScreenHeight]
  }
  PixelSearch __X__, __Y__, start[1], start[2], end[1], end[2], color, variation, Fast RGB
  return [__X__, __Y__]
}
z_49(input) {
  if input is Number
    return "number"
  if (IsFunc(input)) {
    return "function"
  }
  if (IsObject(input)) {
    if (input.Count() == input.Length()) {
      return "array"
    }
    return "object"
  }
  return "string"
}
z_50(input) {
  _type := $.type.Call(input)
  switch _type {
    case "array": {
      return input.Length()
    }
    case "object": {
      return input.Count()
    }
    case "string": {
      return StrLen(input)
    }
    default: {
      throw Exception("$.length: invalid type '" . (_type) . "'")
    }
  }
}
z_51(input, needle) {
  _type := $.type.Call(input)
  if (_type == "string" || _type == "number") {
    return (InStr(input, needle)) > 0
  }
  if (_type == "array") {
    for __i__, it in input {
      if (it == needle) {
        return true
      }
    }
    return false
  }
  throw Exception("$.includes: invalid type '" . (_type) . "'")
}
z_52(input) {
  _type := $.type.Call(input)
  if !(_type == "array") {
    throw Exception("$.reverse: invalid type '" . (_type) . "'")
  }
  _len := $.length.Call(input)
  _output := []
  for i, key in input {
    _output[_len - i + 1] := key
  }
  return _output
}
