class Task < ApplicationRecord
  validates :name, presence: true, length: {in: 3..15, wrong_length: 'Name must be between 3 and 15 characters long'}
  validates :description, presence: true, length: {minimum: 15, wrong_length: 'Description must be at least 15 characters long'}

  belongs_to :subject
  before_save :default_state_value

  def default_state_value
    self.status ||= 'Active'
  end
end
