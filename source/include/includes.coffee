# includes(input: string | array, needle: string): boolean
$.includes = (input, needle) ->
  _type = $.type input
  if _type == 'string' or _type == 'number'
    return (InStr input, needle) > 0
  if _type == 'array'
    for it in input
      if it == needle
        return true
    return false
  throw new Error "$.includes: invalid type '#{_type}'"