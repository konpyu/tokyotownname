$(document).ready ->
  $(".ttn_photo_show_image").imgLiquid({
    fill: false
    onItemError: (a,b,c) ->
      return
  })

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
            town_name = $(this).data('town-name')
            ward_name = $(this).data('ward-name')
            $("#photo-new-upload-town").text("#{ward_name}#{town_name}の写真をアップします")
            $("#photo-new-upload-photo").find("input[name=town_id]").val(town_id)
            $("#photo-new-upload-photo").css("display","block")
      }).appendTo($list)

  $("#photo-new-upload-photo-button").click ->
    $("#ttn-photo-fileupload").click()

  $('#ttn-photo-fileupload').fileupload({
    url: "/photos/upload",
    dataType: 'json',
    autoUpload: true,
  }).on('fileuploadadd',  (e, data) ->
    $(".photo-form-upload-photo").css("display", "inline")
  ).on('fileuploadprocessalways', (e, data) ->
    $("#photo-new-upload-progressbar-message").css("display", "inline")
  ).on('fileuploadprogressall', (e, data) ->
    progress = parseInt(data.loaded / data.total * 100, 10)
    $("#photo-new-upload-progressbar").css("width", "#{progress}%")

  ).on('fileuploaddone', (e, data) ->
    $(".photo-form-upload-photo").find("img").attr("src", data.result.url)
    $(".photo-form-after-upload-area").css("display", "inline")
    $("#photo-image-key").val(data.result.key)
    $("#photo-new-upload-progressbar-message").css("display", "none")
    $("#photo-new-upload-progressbar").css("display", "none")
  ).on('fileuploadfail',  (e, data) ->
    alert("アップロードに失敗しました")
  )

  #- auto pager
  uploading = false
  is_last_page = false
  $(window).bind 'scroll', ->
    scrollHeight = $(document).height()
    scrollPosition = $(window).height() + $(window).scrollTop()
    if (scrollHeight - scrollPosition) < (scrollHeight * 0.03)

      # 非常に雑
      url = '/photos'
      if window.gon.user_id
        url = "/photos?user_id=#{window.gon.user_id}"
      if window.gon.town_id
        url = "/photos?town_id=#{window.gon.town_id}"
      if window.gon.ward_id
        url = "/photos?town_id=#{window.gon.ward_id}"

      unless uploading
        unless is_last_page
          $('#loading-footer').css('display', 'inline')
        uploading = true
        window.ttn_page ||= 1
        $.ajax
          url:  url
          type: 'GET'
          data:
            page: window.ttn_page + 1
          success: (result, textStatus, xhr) ->
            if result.is_last_page
              is_last_page = true
            window.ttn_page = result.page
            $element = $(result.html)
            $element.css('display', 'none')
            $container = $('#ttn-masonry-container')
            $container.append($element)
            $container.imagesLoaded ->
              $element.css('display', 'inline')
              $('#loading-footer').css('display', 'none')
              $container.imagesLoaded ->
                $container.masonry('appended', $element, true)
                setTimeout ->
                  uploading = false
                , 400
