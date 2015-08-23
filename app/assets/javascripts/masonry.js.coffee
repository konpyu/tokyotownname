
$(document).ready ->
  $container = $('#ttn-masonry-container')
  $container.imagesLoaded ->
    $container.masonry({
      itemSelector: '.ttn-masonry-grid-item',
      isFitWidth: true,　
      transitionDuration: 0,
      columnWidth: 360
    });

  $('#ttn-photos-paging').click (e) ->
    console.log e
