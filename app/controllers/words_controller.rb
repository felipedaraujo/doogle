class WordsController < ApplicationController
  def search
    query    = params[:query]
    response = Word.find_by(entry: query) || Word.search_and_create(query)
    render json: response
  end
end
