# getColor(point?: Point): number
$.getColor = (point = '') ->
  unless point
    point = $.getPosition()
  `PixelGetColor, __Result__, % point[1], % point[2], RGB`
  return __Result__