class Program < ActiveRecord::Base
  belongs_to :coach
  belongs_to :school
  has_many :reviews
  has_many :program_images

  validates :sport, :school_id, :coach_id, presence: true

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

  def facility_comments
    reviews.map { |review| review.f_comments}
  end
end
