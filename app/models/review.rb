class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :coach
  belongs_to :program
  belongs_to :school

  validates :user_id, :coach_id, :school_id, :program_id, presence: true
end
