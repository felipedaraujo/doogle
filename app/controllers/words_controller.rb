class WordsController < ApplicationController
  def show
    @word = Word.find(param[:query]) || search_and_create(param[:query])
  end
end
