class Program < ActiveRecord::Base
  belongs_to :coach
  belongs_to :school
  has_many :reviews
  has_many :program_images

  validates :sport, :school_id, :coach_id, :facility_name, presence: true

  def average_main_arena
    array = reviews.map {|review| review.f_main_arena.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_home_atmosphere
    array = reviews.map {|review| review.f_home_atmosphere.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_weight_room
    array = reviews.map {|review| review.f_weight_room.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_locker_room
    array = reviews.map {|review| review.f_locker_room.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_training_facility
    array = reviews.map {|review| review.f_training_facility.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_facility_rating
    ((average_main_arena + average_home_atmosphere + average_weight_room + average_locker_room + average_training_facility)/5).round(1)
  end

  def facility_rankings
    object = [{score: average_main_arena, language: 'main arena'}, {score: average_home_atmosphere, language: 'home atmosphere'}, {score: average_weight_room, language: 'weight room'}, {score: average_locker_room, language: 'locker room'}, {score: average_training_facility, language: 'training facility' }].sort!{|a,b| a[:score] <=> b[:score]}
  end

  def facility_weak_point
    facility_rankings[0][:language]
  end

  def facility_strong_point
    facility_rankings.last[:language]
  end

  def facility_comments
    reviews.map { |review| review.f_comments}
  end

  def all_facilities_average
    Program.all.map(&:average_facility_rating).reduce(&:+)/Program.all.count
  end

  def facility_overall_ranking
    if average_facility_rating > all_facilities_average
      'above average'
    elsif all_facilities_average > average_facility_rating
      'below average'
    else
      'average'
    end
  end

  def self.top_five_facilities
    self.all.sort_by(&:average_facility_rating).reverse[0..4]
  end
end
