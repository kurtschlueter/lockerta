class Program < ActiveRecord::Base
  belongs_to :coach
  belongs_to :school
  has_many :reviews
  has_many :program_images

  validates :sport, :gender, :school_id, :coach_id, presence: true
end
