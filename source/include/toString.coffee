# toString(input: unknown): string
$.toString = (input) ->
  _type = $.type input
  if _type == 'array'
    _result = ''
    for key in input
      _result = "#{_result}, #{$.toString key}"
    return "[#{$.trim _result, ' ,'}]"
  else if _type == 'object'
    _result = ''
    for key, value of input
      _result = "#{_result}, #{key}: #{$.toString value}"
    return "{#{$.trim _result, ' ,'}}"
  return input