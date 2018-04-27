class Subject < ApplicationRecord
  has_many :tasks
  belongs_to :author, optional: true
end
