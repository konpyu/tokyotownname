$(document).ready ->
  $(".ttn_photo_show_image").imgLiquid({
    fill: false
    onItemError: (a,b,c) ->
      console.log a
      console.log b
      console.log c
      return
  })

  # paging
  $('#ttn-photos-paging').click ->
    window.ttn_page ||= 1
    $.ajax
      url:  '/photos'
      type: 'GET'
      data:
        page: window.ttn_page + 1
      success: (result, textStatus, xhr) ->
        window.ttn_page += 1
        $element = $(result.html)
        $element.css('display', 'none')
        $container = $('#ttn-masonry-container')
        $container.append($element)
        $container.imagesLoaded ->
          $element.css('display', 'inline')
          $container.imagesLoaded ->
            $container.masonry('appended', $element, true)
