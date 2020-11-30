# press(key...: string): void
$.press = (listInput...) ->

  # validate
  unless $.length listInput
    throw new Error '$.press: invalid key'

  # format
  __listKey__ = []
  for input in listInput
    __input__ = $.toLowerCase input
    __input__ = $.replace __input__, ' ', ''
    __input__ = $.replace __input__, '-', ''
    __list__ = $.split __input__, '+'
    for it in __list__
      __listKey__.Push it

  # unfold
  __listResult__ = []
  __len__ = $.length __listKey__
  for key, i in __listKey__
    # last
    if i == __len__
      __listResult__[i] = $.split key, ':'
      continue
    # other
    if $.includes key, ':'
      __listResult__[i] = $.split key, ':'
      __listResult__[__len__ * 2 - i] = $.split key, ':'
    else
      __listResult__[i] = [key, 'down']
      __listResult__[__len__ * 2 - i] = [key, 'up']

  # alias & join
  for it, i in __listResult__
    if it[1] == 'win'
      it[1] = 'lwin'
    __listResult__[i] = $.trim "#{it[1]} #{it[2]}"

  # execute
  __output__ = ''
  for it in __listResult__
    __output__ = "#{__output__}{#{it}}"
  `Send, % __output__`