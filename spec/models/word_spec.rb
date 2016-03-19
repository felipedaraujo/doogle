require 'rails_helper'

RSpec.describe Word, type: :model do
  it 'is invalid without an entry' do
    word = Word.new(definition: 'an online dictionary written in Ruby language')
    word.should_not be_valid
  end

  it 'is invalid without an definition' do
    word = Word.new(entry: 'doogle')
    word.should_not be_valid
  end

  it 'creates a new word' do
    expect { Word.search_and_create('love') }.to change { Word.count }.by(1)
  end
end
