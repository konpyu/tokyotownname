$(document).ready ->
  $('#ttnPhotoDetailModal').on 'show.bs.modal', (e) ->
    button = $(e.relatedTarget)
    recipient = button.data('imageurl')
    img = $('img#modal-photo-img')
    img.attr("src", recipient)
