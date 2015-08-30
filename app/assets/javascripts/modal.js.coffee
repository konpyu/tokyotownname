$(document).ready ->
  $('#ttnPhotoDetailModal').on 'show.bs.modal', (e) ->
    button = $(e.relatedTarget)
    recipient = button.data('imageurl')
    img = $('img#modal-photo-img')
    img.attr("src", recipient)

    town_name = $('#modal-photo-town-name')
    town_name.text(button.data('townname'))

    publish_date = $('#modal-photo-publish-date')
    publish_date.text(button.data('pubdate'))

    reporter_name = $('#modal-photo-reporter-name')
    reporter_name.text(button.data('reporter'))

    reporter_img = $('img#modal-photo-reporter-img')
    reporter_img.attr('src', button.data('reporter-img'))
