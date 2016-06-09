class Coach < ActiveRecord::Base
  has_many :reviews
  has_many :programs

  validates :first_name, :last_name, :alma_mater, :gender, :wins, :losses, :year_started, :ncaa_appearances, :conference_titles, :recruiting_state1, :recruiting_state2, :recruiting_state3, presence: true

  def average_player_relationships
    array = reviews.map {|review| review.hc_player_relationships.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_player_development
    array = reviews.map {|review| review.hc_player_development.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_recruiting
    array = reviews.map {|review| review.hc_recruiting.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_pro_connections
    array = reviews.map {|review| review.hc_pro_connections.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def average_sport_knowledge
    array = reviews.map {|review| review.hc_sport_knowledge.to_f }
    (array.reduce(:+)/array.length.to_f).round(1)
  end

  def would_play_again_percent
    array = reviews.map { |review| review.hc_would_play_with_again}
    (array.select{|item| item }.length.to_f/array.length * 100).to_i
  end

  def average_coach_rating
    ((average_player_development + average_player_relationships + average_recruiting + average_pro_connections + average_sport_knowledge)/5).round(1)
  end

  def self.top_five_coaches
    self.all.sort_by(&:average_coach_rating).reverse[0..4]
  end

  def win_percentage
    (wins/(wins + losses.to_f) * 100).round
  end

  def skill_rankings
    object = [{score: average_sport_knowledge, language: 'knowledge of the sport'}, {score: average_pro_connections, language: 'professional connections'}, {score: average_player_development, language: 'development of players'}, {score: average_player_relationships, language: 'development of relationships with players'}, {score: average_recruiting, language: 'recruiting' }].sort!{|a,b| a[:score] <=> b[:score]}
  end

  def weak_point
    skill_rankings[0][:language]
  end

  def strong_point
    skill_rankings.last[:language]
  end

  def his
    gender == 'male' ? 'his' : 'her'
  end

  def he
    gender == 'male' ? 'he' : 'she'
  end

  def comments
    reviews.map { |review| review.hc_comments}
  end
end
