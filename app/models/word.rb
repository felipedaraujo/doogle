class Word < ActiveRecord::Base
  validates :entry, :definition, presence: true

  def self.search_and_create(query)
    dictionary = DictionaryAdapter.new
    result = dictionary.search(query)

    unless result.nil?
      Word.create(entry: result[:entry], definition: result[:definition])
    end
  end
end
