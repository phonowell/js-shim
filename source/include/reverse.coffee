# reverse(input: unknown[]): unknown[]
$.reverse = (input) ->

  __type__ = $.type input
  unless __type__ == 'array'
    throw new Error "$.reverse: invalid type '#{__type__}'"

  __len__ = $.length input
  __output__ = []
  for key, i in input
    __output__[__len__ - i + 1] = key

  return __output__