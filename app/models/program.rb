class Program < ActiveRecord::Base
  belongs_to :coach
  belongs_to :school
  has_many :reviews
  has_many :program_images

  after_create :first_full_name

  validates :sport, :school_id, :coach_id, :facility_name, presence: true

  def self.search(term)
    @schools = where('LOWER(full_name) LIKE :term', term: "%#{term.downcase}%")
  end

  def first_full_name
    update_attributes(full_name: school.name + ' ' + sport)
  end

  def average_main_arena
    if reviews.length > 0
      array = reviews.map {|review| review.f_main_arena.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
    else
      'Not Rated'
    end
  end

  def average_home_atmosphere
    if reviews.length > 0
      array = reviews.map {|review| review.f_home_atmosphere.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
    else
      'Not Rated'
    end
  end

  def average_weight_room
    if reviews.length > 0
      array = reviews.map {|review| review.f_weight_room.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
    else
      'Not Rated'
    end
  end

  def average_locker_room
    if reviews.length > 0
      array = reviews.map {|review| review.f_locker_room.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
    else
      'Not Rated'
    end
  end

  def average_training_facility
    if reviews.length > 0
      array = reviews.map {|review| review.f_training_facility.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
    else
      'Not Rated'
    end
  end

  def average_facility_rating
    if reviews.length > 0
      ((average_main_arena.to_f + average_home_atmosphere + average_weight_room + average_locker_room + average_training_facility)/5).round(1)
    else
      'Not Rated'
    end
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
      Program.all.select{|program| program.average_facility_rating.is_a?(Float)}.map(&:average_facility_rating).reduce(&:+)/Program.all.count
  end

  def facility_overall_ranking
    if average_facility_rating.is_a?(String)
      'average'
    elsif average_facility_rating > all_facilities_average
      'above average'
    elsif all_facilities_average > average_facility_rating
      'below average'
    else
      'average'
    end
  end

  def self.top_five_facilities
    self.all.select{|program| program.reviews.length > 0}.sort_by(&:average_facility_rating).reverse[0..4]
  end

  def graduated_percent
    if reviews.length > 0
      array = reviews.map { |review| review.e_graduated}
      (array.select{|item| item }.length.to_f/array.length * 100).to_i
    else
      'unknown'
    end
  end

  def graduated_comparison
    if graduated_percent.is_a?(Integer)
      graduated_percent >= 73 ? 'above average' : 'below average'
    else
      'unknown'
    end
  end
end
