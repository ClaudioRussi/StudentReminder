class Subject < ApplicationRecord
  validates :description, presence: true, length:{minimum: 10, wrong_length: 'Description must be at least 10 characters long'}
  validates :name, presence: true, length:{in: 3..15, wrong_length: 'Description must be between 3 and 10 characters long'}

  has_many :tasks
  belongs_to :author, class_name: 'User'
end
