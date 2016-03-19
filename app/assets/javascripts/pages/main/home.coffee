App.main = App.main || {}

class App.main.home

  constructor: (@options = {}) ->
    @make()

  make: () ->
    new App.main.home.searchDoogle
