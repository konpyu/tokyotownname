class @Comments

  constructor: () ->
    @cleanBinding()
    @addBinding()

  addBinding: ->
    $(document).on "ajax:success", "#ttn_comment_form", @addCommentToList
    return

  cleanBinding: ->
    $(document).off "ajax:success", "#ttn_comment_form"
    return

  addCommentToList: (xhr, data, status, res) ->
    if res.status is 201
      apnd = "<li><span class='text-info'>konpyu</span> #{data.comment.comment} <a>delete</a></li>"
      $("#comment-list").append(apnd)
      $(".form-control").val("")
