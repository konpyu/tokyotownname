class @Search
  constructor: ->
    $(document).off "keyup", '#searchtown'
    $(document).on  "keyup", '#searchtown', (eventobj) ->
      searchTxt = $("#searchtown").val()
      $(".search-ward-name").css("display", "none")

      $(".search-links-town-name").each (data, searchTownUnit) ->
        townName = $(searchTownUnit).data("town-name")

        regObj = new RegExp(searchTxt)
        if townName.search(regObj) >= 0
          $(searchTownUnit).css("display", "inline")
          $(searchTownUnit).parent().parent().find(".search-ward-name").css("display", "block")
        else
          $(searchTownUnit).css("display", "none")

    $(".search-links-fugafuga").click (event) ->
      town_id   = $(this).data('id')
      town_name = $(this).data('town_name')
      ward_name = $(this).data('ward_name')
      $("#photo-new-upload-photo").css("display","block")
      $("#photo-new-upload-photo").find("input[name=town_id]").val(town_id)
      $("#photo-new-upload-town").text("#{ward_name}#{town_name}の写真をアップします")
      $(window).scrollTop(0)
