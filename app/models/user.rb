class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, length:{in: 3..15, wrong_length: 'Name must be between 3 and 15 characters long'}, presence: true

  has_many :subjects
  has_many :tasks, through: :subjects
end
