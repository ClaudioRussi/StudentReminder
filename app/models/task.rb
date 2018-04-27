class Task < ApplicationRecord
  belongs_to :subject

  before_save :default_state_value

  def default_state_value
    self.status ||= 'Active'
  end
end
