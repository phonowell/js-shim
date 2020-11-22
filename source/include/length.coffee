# length(input: string | array | object): number
$.length = (input) ->
  _type = $.type input
  switch _type
    when 'array' then return input.Length()
    when 'object' then return input.Count()
    when 'string' then return StrLen input
    else throw new Error "$.length: invalid type '#{_type}'"