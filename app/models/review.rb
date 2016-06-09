class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :coach
  belongs_to :program
  belongs_to :school

  validates :user_id, :coach_id, :school_id, :program_id, presence: true

  def average_coach_rating
    ((hc_player_development + hc_player_relationships + hc_recruiting + hc_pro_connections + hc_sport_knowledge)/5).round(1)
  end

  def average_facility_rating
    ((f_main_arena + f_home_atmosphere + f_weight_room + f_locker_room + f_training_facility)/5).round(1)
  end
end
