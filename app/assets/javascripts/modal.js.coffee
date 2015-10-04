$(document).ready ->
  $('#ttnEntryOrLoginModal').on 'show.bs.modal', (e) ->
    console.log "Login"
  $('#ttnPhotoDetailModal').on 'show.bs.modal', (e) ->

    # init dom
    $('img#modal-photo-img').attr("src", "")
    $('#modal-photo-publish-date').text("")
    $('#modal-photo-town-name').text("")
    $('#modal-photo-reporter-name').text("")
    $('#modal-photo-reporter-img').attr("src", "")
    $("#comment-list").text("")
    $('#comment-count').text("")

    button = $(e.relatedTarget)
    photo_id = button.data('photo-id')

    photos = window.gon.photos
    photo = photos[photo_id]

    $('img#modal-photo-img').attr("src", photo.url)
    $('#modal-photo-publish-date').text(photo.created_at)
    $('#modal-photo-town-name').text("#{photo.ward.name}#{photo.town.name}")
    $('#modal-photo-reporter-name').text(photo.user.name)
    $('#modal-photo-comment').text(photo.comment)
    $('#modal-photo-reporter-img').attr("src", photo.user.image)
    $('#modal-photo-commentable-id').val(photo.id)

    # TODO: codedup
    for comment in photo.comments
      apnd = "<p><span class='text-info'>konpyu</span> #{comment.comment} <a>delete</a></p>"
      $("#comment-list").append(apnd)
    if photo.comments
      $('#comment-count').text("#{photo.comments.length} Comments")
