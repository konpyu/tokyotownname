$(document).ready ->
  $(".ttn_photo_show_image").imgLiquid({
    fill: false
    onItemError: (a,b,c) ->
      console.log a
      console.log b
      console.log c
      return
  })
  return

