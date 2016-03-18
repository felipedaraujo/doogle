class Word < ActiveRecord::Base
  validates :entry, :definition, presence: true
end
