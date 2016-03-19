App.main.home = App.main.home || {}

class App.main.home.searchDoogle

  constructor: (@options = {}) ->
    @make()
    @bind()

  make: () ->
    @$form = $('.js-search-doogle')

  bind: () ->
    @$form.submit ->
      if $.trim($('.js-query').val()) == ''
        return false

      valuesToSubmit = $(this).serialize()
      $.ajax(
        type: 'GET'
        url: $(this).attr('action')
        data: valuesToSubmit
        dataType: 'JSON')
      .success (json) ->
        if json
          $('.js-message').empty()
          $('.js-entry').html(json.entry)
          $('.js-definition').html(json.definition)
        else
          $('.js-entry').empty()
          $('.js-definition').empty()
          $('.js-message').html('Your result was not found')
        return
      false
