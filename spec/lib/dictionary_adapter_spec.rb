require 'rails_helper'

describe DictionaryAdapter do
  context '.search' do
    it "returns a word" do
      dictionary = DictionaryAdapter.new
      word = {
        status: :ok,
        entry: 'existence',
        definition: ':reality as opposed to appearance'
      }
      expect(dictionary.search('existence')).to eq(word)
    end

    it "does not return a word" do
      dictionary = DictionaryAdapter.new
      expect(dictionary.search('inesistente-word')).to eq(nil)
    end
  end
end
