class School < ActiveRecord::Base
  has_many :reviews
  has_many :programs
  has_many :users

  validates :name, :location, :tuition, :location_population, presence: true

  def self.search(term)
    # puts '----------entered self.search model----------'
    # puts term
    # puts '----------------------------'
    @schools = where('LOWER(name) LIKE :term', term: "%#{term.downcase}%")
  end

  def average_l_program_tradition
    array = reviews.map {|review| review.l_program_tradition.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_l_community_interest
    array = reviews.map {|review| review.l_community_interest.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_l_weather
    array = reviews.map {|review| review.l_weather.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_l_nightlife
    array = reviews.map {|review| review.l_nightlife.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_location_rating
    ((average_l_program_tradition.to_f + average_l_community_interest + average_l_weather + average_l_nightlife)/4).round(1)
  end

  def location_skill_rankings
    object = [{score: average_l_program_tradition, language: 'program tradition'}, {score: average_l_community_interest, language: 'community interest'}, {score: average_l_weather, language: 'weather'}, {score: average_l_nightlife, language: 'nightlife'}].sort!{|a,b| a[:score] <=> b[:score]}
  end

  def location_weak_point
    location_skill_rankings[0][:language]
  end

  def location_strong_point
    location_skill_rankings.last[:language]
  end

  def all_locations_average
      School.all.select{|school| school.average_location_rating.is_a?(Float)}.map(&:average_location_rating).reduce(&:+)/School.all.count
  end

  def location_overall_ranking
    if average_location_rating.is_a?(String)
      'average'
    elsif average_location_rating > all_locations_average
      'above average'
    elsif all_locations_average > average_location_rating
      'below average'
    else
      'average'
    end
  end

  def self.top_five_locations
    self.all.sort_by(&:average_location_rating).reverse[0..4]
  end

  def location_comments
    reviews.map { |review| review.l_comments}
  end

  def average_e_school_difficulty
    array = reviews.map {|review| review.e_school_difficulty.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_e_academic_support
    array = reviews.map {|review| review.e_academic_support.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_e_school_reputation
    array = reviews.map {|review| review.e_school_reputation.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_education_rating
    ((average_e_school_difficulty.to_f + average_e_academic_support + average_e_school_reputation)/3).round(1)
  end

  def self.top_five_educations
    self.all.sort_by(&:average_education_rating).reverse[0..4]
  end

  def graduated_percent
    array = reviews.map { |review| review.e_graduated}
    (array.select{|item| item }.length.to_f/array.length * 100).to_i
  end

  def education_comments
    reviews.map { |review| review.e_comments}
  end

  def programs_at_school
    programs.map{|program| program.school.name + ' ' + program.sport}
  end
end
