# alert(message: string): void
alert = (message = '') ->

  __msg__ = $.toString message
  `MsgBox, % __msg__`