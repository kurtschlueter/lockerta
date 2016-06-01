class Coach < ActiveRecord::Base
  has_many :reviews
  has_many :programs

  validates :first_name, :last_name, :alma_mater, :gender, :wins, :losses, :year_started, :ncaa_appearances, :conference_titles, :recruiting_state1, :recruiting_state2, :recruiting_state3, presence: true
end
