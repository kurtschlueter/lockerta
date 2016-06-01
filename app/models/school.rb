class School < ActiveRecord::Base
  has_many :reviews
  has_many :programs
  has_many :users

  validates :name, :location, presence: true
end
