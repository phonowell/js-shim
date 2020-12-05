global $ := {}
$.beep := Func("z_51")
$.click := Func("z_50")
global __index_debounce__ := 0
global __timer_debounce__ := {}
$.debounce := Func("z_49")
$.delay := Func("z_47")
$.exit := Func("z_46")
$.findColor := Func("z_45")
$.findImage := Func("z_44")
$.formatHotkey := Func("z_43")
$.getColor := Func("z_42")
$.getPosition := Func("z_41")
$.getState := Func("z_40")
$.i := Func("z_39")
$.includes := Func("z_38")
$.info := Func("z_37")
$.length := Func("z_36")
$.move := Func("z_35")
$.now := Func("z_34")
$.off := Func("z_33")
$.on := Func("z_32")
$.open := Func("z_31")
$.press := Func("z_30")
$.random := Func("z_29")
$.reload := Func("z_28")
$.replace := Func("z_27")
$.reverse := Func("z_26")
$.setFixed := Func("z_25")
$.sleep := Func("z_24")
$.split := Func("z_23")
$.suspend := Func("z_22")
global __index_throttle__ := 0
global __timer_throttle__ := {}
global __ts_throttle__ := {}
$.throttle := Func("z_21")
$.toLowerCase := Func("z_18")
$.toString := Func("z_17")
$.toUpperCase := Func("z_16")
$.trim := Func("z_15")
$.trimEnd := Func("z_14")
$.trimStart := Func("z_13")
$.type := Func("z_12")
global alert := Func("z_11")
global clearInterval := Func("z_10")
global clearTimeout := Func("z_9")
global Math := {abs: Func("z_8"), ceil: Func("z_7"), floor: Func("z_6"), round: Func("z_5")}
global setInterval := Func("z_4")
global setTimeout := Func("z_3")
$.on.Call("f1", $.throttle.Call(1000, Func("z_2")))
$.on.Call("f2", $.debounce.Call(2000, Func("z_1")))
z_1() {
  $.info.Call($.now.Call())
}
z_2() {
  $.info.Call($.now.Call())
}
z_3(callback, time) {
  if (($.type.Call(callback)) == "function") {
    callback := callback.Bind()
  }
  __type__ := $.type.Call(time)
  if !(__type__ == "number") {
    throw Exception("setTimeout: invalid time type '" . (__type__) . "'")
  }
  if (time <= 0) {
    time := 1
  }
  SetTimer, % callback, % 0 - time
  return callback
}
z_4(callback, time) {
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
z_5(n) {
  return Round(n)
}
z_6(n) {
  return Floor(n)
}
z_7(n) {
  return Ceil(n)
}
z_8(n) {
  return Abs(n)
}
z_9(callback) {
  if !(callback) {
    return
  }
  SetTimer, % callback, Delete
}
z_10(callback) {
  if !(callback) {
    return
  }
  SetTimer, % callback, Delete
}
z_11(message := "") {
  __msg__ := $.toString.Call(message)
  MsgBox, % __msg__
}
z_12(input) {
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
z_13(input, omitting := " `t") {
  return LTrim(input, omitting)
}
z_14(input, omitting := " `t") {
  return RTrim(input, omitting)
}
z_15(input, omitting := " `t") {
  return Trim(input, omitting)
}
z_16(input) {
  StringUpper, __result__, input
  return __result__
}
z_17(input) {
  __type__ := $.type.Call(input)
  if (__type__ == "array") {
    __result__ := ""
    for __i__, key in input {
      __result__ := "" . (__result__) . ", " . ($.toString.Call(key)) . ""
    }
    return "[" . ($.trim.Call(__result__, " ,")) . "]"
  } else if (__type__ == "object") {
    __result__ := ""
    for key, value in input {
      __result__ := "" . (__result__) . ", " . (key) . ": " . ($.toString.Call(value)) . ""
    }
    return "{" . ($.trim.Call(__result__, " ,")) . "}"
  }
  return input
}
z_18(input) {
  StringLower, __result__, input
  return __result__
}
z_19(index, callback) {
  callback.Call()
  __ts_throttle__[index] := $.now.Call()
}
z_20(index, time, callback) {
  clearTimeout.Call(__timer_throttle__[index])
  __timer_throttle__[index] := setTimeout.Call(Func("z_19").Bind(index, callback), __ts_throttle__[index] - $.now.Call() + time)
}
z_21(time, callback) {
  __index_throttle__++
  __ts_throttle__[__index_throttle__] := 0
  return Func("z_20").Bind(__index_throttle__, time, callback)
}
z_22(isSuspended := "Toggle") {
  if (isSuspended != "Toggle") {
    if (isSuspended) {
      isSuspended := "On"
    } else {
      isSuspended := "Off"
    }
  }
  Suspend, % isSuspended
}
z_23(input, delimiter) {
  return StrSplit(input, delimiter)
}
z_24(time) {
  Sleep, % time
}
z_25(isFixed := "Toggle") {
  if (isFixed != "Toggle") {
    if (isFixed) {
      isFixed := "On"
    } else {
      isFixed := "Off"
    }
  }
  Winset AlwaysOnTop, % isFixed, A
}
z_26(input) {
  __type__ := $.type.Call(input)
  if !(__type__ == "array") {
    throw Exception("$.reverse: invalid type '" . (__type__) . "'")
  }
  __len__ := $.length.Call(input)
  __output__ := []
  for i, key in input {
    __output__[__len__ - i + 1] := key
  }
  return __output__
}
z_27(input, searchment, replacement, limit := -1) {
  return StrReplace(input, searchment, replacement, limit)
}
z_28() {
  Reload
}
z_29(min := 0, max := 1) {
  Random, __result__, min, max
  return __result__
}
z_30(listInput*) {
  if !($.length.Call(listInput)) {
    throw Exception("$.press: invalid key")
  }
  __listKey__ := []
  for __i__, input in listInput {
    __input__ := $.toLowerCase.Call(input)
    __input__ := $.replace.Call(__input__, " ", "")
    __input__ := $.replace.Call(__input__, "-", "")
    __list__ := $.split.Call(__input__, "+")
    for __i__, it in __list__ {
      __listKey__.Push(it)
    }
  }
  __listResult__ := []
  __len__ := $.length.Call(__listKey__)
  for i, key in __listKey__ {
    if (i == __len__) {
      __listResult__[i] := $.split.Call(key, ":")
      continue
    }
    if ($.includes.Call(key, ":")) {
      __listResult__[i] := $.split.Call(key, ":")
      __listResult__[__len__ * 2 - i] := $.split.Call(key, ":")
    } else {
      __listResult__[i] := [key, "down"]
      __listResult__[__len__ * 2 - i] := [key, "up"]
    }
  }
  for i, it in __listResult__ {
    if (it[1] == "win") {
      it[1] := "lwin"
    }
    __listResult__[i] := $.trim.Call("" . (it[1]) . " " . (it[2]) . "")
  }
  __output__ := ""
  for __i__, it in __listResult__ {
    __output__ := "" . (__output__) . "{" . (it) . "}"
  }
  Send, % __output__
}
z_31(source) {
  Run, % source
}
z_32(key, callback) {
  key := $.formatHotkey.Call(key)
  Hotkey, % key, % callback, On
}
z_33(key, callback) {
  key := $.formatHotkey.Call(key)
  Hotkey, % key, % callback, Off
}
z_34() {
  return A_TickCount
}
z_35(point := "", speed := 0) {
  if !(point) {
    throw Exception("$.move: invalid point")
  }
  MouseMove, point[1], point[2], speed
}
z_36(input) {
  __type__ := $.type.Call(input)
  switch __type__ {
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
      throw Exception("$.length: invalid type '" . (__type__) . "'")
    }
  }
}
z_37(message, point := "") {
  if !(message) {
    return message
  }
  if !(point) {
    point := $.getPosition.Call()
  }
  __msg__ := $.toString.Call(message)
  ToolTip, % __msg__, % point[1], % point[2]
  return message
}
z_38(input, needle) {
  __type__ := $.type.Call(input)
  if (__type__ == "string" || __type__ == "number") {
    return (InStr(input, needle)) > 0
  }
  if (__type__ == "array") {
    for __i__, it in input {
      if (it == needle) {
        return true
      }
    }
    return false
  }
  throw Exception("$.includes: invalid type '" . (__type__) . "'")
}
z_39(message) {
  $.info.Call("" . ($.now.Call()) . " " . ($.toString.Call(message)) . "")
  return message
}
z_40(key) {
  return GetKeyState(key, "P")
}
z_41() {
  MouseGetPos, __x__, __y__
  return [__x__, __y__]
}
z_42(point := "") {
  if !(point) {
    point := $.getPosition.Call()
  }
  PixelGetColor, __result__, % point[1], % point[2], RGB
  return __result__
}
z_43(key) {
  __listkey__ := []
  __key__ := $.toLowerCase.Call(key)
  __key__ := $.replace.Call(__key__, " ", "")
  __key__ := $.replace.Call(__key__, "-", "")
  _list := $.split.Call(__key__, "+")
  for __i__, it in _list {
    __listkey__.Push(it)
  }
  __isAlt__ := false
  __isCtrl__ := false
  __isShift__ := false
  __isWin__ := false
  __listResult__ := []
  for __i__, key in __listkey__ {
    if (key == "alt") {
      __isAlt__ := true
      continue
    }
    if (key == "ctrl") {
      __isCtrl__ := true
      continue
    }
    if (key == "shift") {
      __isShift__ := true
      continue
    }
    if (key == "win") {
      __isWin__ := true
      continue
    }
    __listResult__.Push(key)
  }
  __prefix__ := ""
  if (__isAlt__) {
    __prefix__ := "" . (__prefix__) . "!"
  }
  if (__isCtrl__) {
    __prefix__ := "" . (__prefix__) . "^"
  }
  if (__isShift__) {
    __prefix__ := "" . (__prefix__) . "+"
  }
  if (__isWin__) {
    __prefix__ := "" . (__prefix__) . "#"
  }
  __result__ := ""
  for __i__, it in __listResult__ {
    __result__ := "" . (__result__) . " & " . (it) . ""
  }
  return $.replace.Call("" . (__prefix__) . "" . ($.trim.Call(__result__, " &")) . "", ":", " ")
}
z_44(source, start := "", end := "") {
  if !(start) {
    start := [0, 0]
  }
  if !(end) {
    end := [A_ScreenWidth, A_ScreenHeight]
  }
  ImageSearch __x__, __y__, start[1], start[2], end[1], end[2], % A_ScriptDir . "\\\" . source
  return [__x__, __y__]
}
z_45(color, start := "", end := "", variation := 0) {
  if !(start) {
    start := [0, 0]
  }
  if !(end) {
    end := [A_ScreenWidth, A_ScreenHeight]
  }
  PixelSearch __x__, __y__, start[1], start[2], end[1], end[2], color, variation, Fast RGB
  return [__x__, __y__]
}
z_46() {
  ExitApp
}
z_47(time, callback) {
  __timer__ := setTimeout.Call(callback, time)
  return __timer__
}
z_48(index, time, callback) {
  clearTimeout.Call(__timer_debounce__[index])
  __timer_debounce__[index] := setTimeout.Call(callback, time)
}
z_49(time, callback) {
  __index_debounce__++
  return Func("z_48").Bind(__index_debounce__, time, callback)
}
z_50(key := "left") {
  key := $.replace.Call(key, "-", "")
  key := $.replace.Call(key, ":", " ")
  Click, % key
}
z_51() {
  SoundBeep
}
