$(document).ready ->
  $('#ttnPhotoDetailModal').on 'show.bs.modal', (e) ->
    button = $(e.relatedTarget)
    photo_id = button.data('photo-id')

    photos = window.gon.photos
    photo = photos[photo_id]

    $('img#modal-photo-img').attr("src", photo.url)
    $('#modal-photo-publish-date').text(photo.created_at)
    $('#modal-photo-town-name').text("#{photo.ward.name}#{photo.town.name}")
    $('#modal-photo-reporter-name').text(photo.user.name)
    $('#modal-photo-reporter-img').attr("src", photo.user.image)
