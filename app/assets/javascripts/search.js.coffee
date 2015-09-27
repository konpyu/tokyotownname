class @Search
  constructor: ->
    $(document).off "keyup", '#searchtown'
    $(document).on  "keyup", '#searchtown', (eventobj) ->
      searchTxt = $("#searchtown").val()
      $(".search-ward-name").css("display", "none")

      $(".search-links-ward-unit").children(".search-links-hoge").each (data, searchTownUnit) ->
        townName = $(searchTownUnit).data("town-name")

        regObj = new RegExp(searchTxt)
        if townName.search(regObj) >= 0
          $(searchTownUnit).css("display", "inline")
          $(searchTownUnit).parent().find(".search-ward-name").css("display", "block")
        else
          $(searchTownUnit).css("display", "none")

