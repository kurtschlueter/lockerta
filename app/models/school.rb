class School < ActiveRecord::Base
  has_many :reviews
  has_many :programs
  has_many :users

  validates :name, :location, presence: true

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
    ((average_l_program_tradition + average_l_community_interest + average_l_weather + average_l_nightlife)/4).round(1)
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
    ((average_e_school_difficulty + average_e_academic_support + average_e_school_reputation)/3).round(1)
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
