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

  toggleLived: (xhr, data, status, res) ->
    form = $("#ttn_lived")
    submit = form.find("input[type='submit']")

    if res.status is 201
      submit.val("やっぱ住んでない")
    else if res.status is 204
      submit.val("住んでた")
    return
