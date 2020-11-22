global $ := {}
$.beep := Func("z_45") ; beep(): void
$.click := Func("z_44") ; click(key?: string): void
$.delay := Func("z_43") ; delay(time: number, callback: Function): string
$.exit := Func("z_42") ; exit(): void
$.findColor := Func("z_41") ; findColor( color: number, start: Point = [0, 0], end: Point = [A_ScreenWidth, A_ScreenHeight], variation = 0 ): Point
$.findImage := Func("z_40") ; findImage( source: string, start: Point = [0, 0], end: Point = [A_ScreenWidth, A_ScreenHeight], ): Point
$.formatHotkey := Func("z_39") ; formatHotkey(key: string): string
$.getColor := Func("z_38") ; getColor(point?: Point): number
$.getPosition := Func("z_37") ; getPosition(): Point
$.getState := Func("z_36") ; getState(key: string): string
$.i := Func("z_35") ; i(message: string): string
$.includes := Func("z_34")
$.info := Func("z_33") ; info(message: string, point?: Point): string
$.length := Func("z_32") ; length(input: string | array | object): number
$.move := Func("z_31") ; move(point: Point, speed: number = 0): void
$.now := Func("z_30") ; now(): number
$.off := Func("z_29") ; off(key: string, callback: Function): void
$.on := Func("z_28") ; on(key, string, callback: Function): void
$.open := Func("z_27") ; open(source: string): void
$.press := Func("z_26") ; press(key...: string): void
$.random := Func("z_25") ; random(min: number = 0, max: number = 1): number
$.reload := Func("z_24") ; reload(): void
$.replace := Func("z_23") ; replace( input: string, searchment: string, replacement: string, limit: number = -1 )
$.reverse := Func("z_22") ; reverse(input: unknown[]): unknown[]
$.setFixed := Func("z_21") ; setFixed(fixed?: boolean): void
$.sleep := Func("z_20") ; sleep(time: number): void
$.split := Func("z_19") ; split(input: string, delimiter: string): string
$.suspend := Func("z_18") ; suspend(suspended?: boolean): void
$.toLowerCase := Func("z_17") ; toLowerCase(input: string): string
$.toString := Func("z_16") ; toString(input: unknown): string
$.toUpperCase := Func("z_15") ; toUpperCase(input: string): string
$.trim := Func("z_14") ; trim(input: string, omitting: string): string
$.trimEnd := Func("z_13") ; trimEnd(input: string, omitting: string): string
$.trimStart := Func("z_12") ; trimStart(input: string, omitting: string): string
$.type := Func("z_11") ; type(input: unknown): 'array' | 'function' | 'number' | 'object' | 'string'
global alert := Func("z_10") ; alert(message: string): void
global clearInterval := Func("z_9") ; clearInterval(callback: Function): void
global clearTimeout := Func("z_8") ; clearTimeout(callback: Function): void
global Math := {abs: Func("z_7"), ceil: Func("z_6"), floor: Func("z_5"), round: Func("z_4")} ; abs(n: number): number ceil(n: number): number floor(n: number): number round(n: number): number
global setInterval := Func("z_3") ; setInterval(callback: Function, time: number): string
global setTimeout := Func("z_2") ; setTimeout(callback: Function, time: number): string
$.on.Call("1", Func("z_1"))
z_1() {
  alert.Call($.getState.Call("2"))
}
z_2(callback, time) {
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
z_3(callback, time) {
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
z_4(n) {
  return Round(n)
}
z_5(n) {
  return Floor(n)
}
z_6(n) {
  return Ceil(n)
}
z_7(n) {
  return Abs(n)
}
z_8(callback) {
  if !(callback) {
    return
  }
  SetTimer, % callback, Delete
}
z_9(callback) {
  if !(callback) {
    return
  }
  SetTimer, % callback, Delete
}
z_10(message := "") {
  __msg__ := $.toString.Call(message)
  MsgBox, % __msg__
}
z_11(input) {
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
z_12(input, omitting := " `t") {
  return LTrim(input, omitting)
}
z_13(input, omitting := " `t") {
  return RTrim(input, omitting)
}
z_14(input, omitting := " `t") {
  return Trim(input, omitting)
}
z_15(input) {
  StringUpper, __Result__, input
  return __Result__
}
z_16(input) {
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
z_17(input) {
  StringLower, __Result__, input
  return __Result__
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
z_19(input, delimiter) {
  return StrSplit(input, delimiter)
}
z_20(time) {
  Sleep, % time
}
z_21(isFixed := "Toggle") {
  if (isFixed != "Toggle") {
    if (isFixed) {
      isFixed := "On"
    } else {
      isFixed := "Off"
    }
  }
  Winset AlwaysOnTop, % isFixed, A
}
z_22(input) {
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
z_23(input, searchment, replacement, limit := -1) {
  return StrReplace(input, searchment, replacement, limit)
}
z_24() {
  Reload
}
z_25(min := 0, max := 1) {
  Random, __Result__, min, max
  return __Result__
}
z_26(listInput*) {
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
z_27(source) {
  Run, % source
}
z_28(key, callback) {
  key := $.formatHotkey.Call(key)
  Hotkey, % key, % callback, On
}
z_29(key, callback) {
  key := $.formatHotkey.Call(key)
  Hotkey, % key, % callback, Off
}
z_30() {
  return A_TickCount
}
z_31(point := "", speed := 0) {
  if !(point) {
    throw Exception("$.move: invalid point")
  }
  MouseMove, point[1], point[2], speed
}
z_32(input) {
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
z_33(message, point := "") {
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
z_34(input, needle) {
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
z_35(message) {
  $.info.Call("" . ($.now.Call()) . " " . ($.toString.Call(message)) . "")
  return message
}
z_36(key) {
  return GetKeyState(key, "P")
}
z_37() {
  MouseGetPos, __x__, __y__
  return [__x__, __y__]
}
z_38(point := "") {
  if !(point) {
    point := $.getPosition.Call()
  }
  PixelGetColor, __Result__, % point[1], % point[2], RGB
  return __Result__
}
z_39(key) {
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
z_40(source, start := "", end := "") {
  if !(start) {
    start := [0, 0]
  }
  if !(end) {
    end := [A_ScreenWidth, A_ScreenHeight]
  }
  ImageSearch __x__, __y__, start[1], start[2], end[1], end[2], % A_ScriptDir . "\\\" . source
  return [__x__, __y__]
}
z_41(color, start := "", end := "", variation := 0) {
  if !(start) {
    start := [0, 0]
  }
  if !(end) {
    end := [A_ScreenWidth, A_ScreenHeight]
  }
  PixelSearch __x__, __y__, start[1], start[2], end[1], end[2], color, variation, Fast RGB
  return [__x__, __y__]
}
z_42() {
  ExitApp
}
z_43(time, callback) {
  __timer__ := setTimeout.Call(callback, time)
  return __timer__
}
z_44(key := "left") {
  key := $.replace.Call(key, "-", "")
  key := $.replace.Call(key, ":", " ")
  Click, % key
}
z_45() {
  SoundBeep
}
