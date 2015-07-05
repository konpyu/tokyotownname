class @Lives

  constructor: () ->
    @cleanBinding()
    @addBinding()

  addBinding: ->
    $(document).on "ajax:success", "#ttn_lived", @toggleLived
    return

  cleanBinding: ->
    $(document).off "ajax:success", "#ttn_lived"
    return

  toggleLived: (xhr, data, status) ->
    form = $("#ttn_lived")
    submit = form.find("input[type='submit']")

    if data.status == "lived"
      submit.val("住んでた")
    else
      submit.val("やっぱ住んでない")
    return
