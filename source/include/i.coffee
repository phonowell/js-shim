# i(message: string): string
$.i = (message) ->

  $.info "#{$.now()} #{$.toString message}"
  return message