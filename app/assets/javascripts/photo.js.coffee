$(document).ready ->
  $(".ttn_photo_show_image").imgLiquid({
    fill: false
    onItemError: (a,b,c) ->
      console.log a
      console.log b
      console.log c
      return
  })

  #stateChange = (state) ->
  #  if state is 'ward'

  # create new photo
  $('.photo-new-ward').click ->
    ward_id = $(this).data('id')
    $list = $('#photo-new-choose-town').find('ul')
    $list.empty()
    $("#photo-new-choose-town").css("display", "inline")
    for town in window.gon.wards[ward_id]["towns"]
      $("<a>", {
        addClass: "btn btn-default photo-new-town"
        text: town.name
        data:
          id: town.id
          town_name: town.name
          ward_name: window.gon.wards[ward_id]["name"]
        on:
          click: ->
            town_id   = $(this).data('id')
            town_name = $(this).data('town_name')
            ward_name = $(this).data('ward_name')
            $("#photo-new-upload-town").text("#{ward_name}#{town_name}の写真をアップします")
            $("#photo-new-upload-photo").find("input[name=town_id]").val(town_id)
            $("#photo-new-upload-photo").css("display","block")
      }).appendTo($list)

  # paging
  $('#ttn-photos-paging').click ->
    window.ttn_page ||= 1
    $.ajax
      url:  '/photos'
      type: 'GET'
      data:
        page: window.ttn_page + 1
      success: (result, textStatus, xhr) ->
        if result.is_last_page
          $('#ttn-photos-paging').css('display', 'none')
        window.ttn_page = result.page
        $element = $(result.html)
        $element.css('display', 'none')
        $container = $('#ttn-masonry-container')
        $container.append($element)
        $container.imagesLoaded ->
          $element.css('display', 'inline')
          $container.imagesLoaded ->
            $container.masonry('appended', $element, true)

  $("#photo-new-upload-photo-button").click ->
    $("#ttn-photo-fileupload").click()

  $('#ttn-photo-fileupload').fileupload({
    url: "/photos/upload",
    dataType: 'json',
    autoUpload: true,
  }).on('fileuploadadd',  (e, data) ->
    $(".photo-form-upload-photo").css("display", "inline")
  ).on('fileuploadprocessalways', (e, data) ->
  ).on('fileuploaddone', (e, data) ->
    $(".photo-form-upload-photo").find("img").attr("src", data.result.url)
    $(".photo-form-after-upload-area").css("display", "inline")
    $("#photo-image-key").val(data.result.key)
  ).on('fileuploadfail',  (e, data) ->
    alert("アップロードに失敗しました")
  )

