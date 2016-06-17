module ReviewsHelper

  def has_reviews?(record)
    record.reviews.length > 0
  end

  def coach_has_no_reviews(program, coach)
    program.reviews.where(coach_id: coach.id).length == 0
  end


    def self.generate_url(user)
    "http://www.google.com/#q=#{user.name}"
  end

  def dom_ids_to_string_empty_fields(id_array)
    ReviewsHelper.dom_ids_to_string_empty_fields(id_array)
  end
  # This changes DOM id's to string so that the user sees 'missing field: Head Coach Comments' vs 'hc_comments'
  def self.dom_ids_to_string_empty_fields(id_array)
    output_array = []
    id_array.each do |single_id|
      if single_id == "hc_player_relationships"
        output_array << "Head Coach Player Relationships"
      elsif single_id == "hc_player_development"
        output_array << "Head Coach Player Development"
      elsif single_id == "hc_recruiting"
        output_array << "Head Coach Recruiting"
      elsif single_id == "hc_pro_connections"
        output_array << "Head Coach Pro Connections"
      elsif single_id == "hc_sport_knowledge"
        output_array << "Head Coach_Sport_Knowledge"
      elsif single_id == "hc_would_play_with_again"
        output_array << "Would Play for Heac Coach Again?"
      elsif single_id == "hc_comments"
        output_array << "Head Coach Comments"
      elsif single_id == "f_main_arena"
        output_array << "Facilities Main Arena"
      elsif single_id == "f_home_atmosphere"
        output_array << "Facilities Home Atmosphere"
      elsif single_id == "f_weight_room"
        output_array << "Facilities Weight Room"
      elsif single_id == "f_locker_room"
        output_array << "Facilities Locker Room"
      elsif single_id == "f_training_facility"
        output_array << "Facilities Training Facility"
      elsif single_id == "f_comments"
        output_array << "Facilities Comments"
      elsif single_id == "l_program_tradition"
        output_array << "Location Program Tradition"
      elsif single_id == "l_community_interest"
        output_array << "Location Community Interest"
      elsif single_id == "l_weather"
        output_array << "Location Weather"
      elsif single_id == "l_nightlife"
        output_array << "Location Nightlife"
      elsif single_id == "l_comments"
        output_array << "Location Comments"
      elsif single_id == "e_school_difficulty"
        output_array << "Education School Difficulty"
      elsif single_id == "e_academic_support"
        output_array << "Education Academic Support"
      elsif single_id == "e_school_reputation"
        output_array << "Education School Reputation"
      elsif single_id == "e_graduated"
        output_array << "Did you Graduate?"
      elsif single_id == "e_comments"
        output_array << "Education Comments"
      elsif single_id == "conference_rival"
        output_array << "Conference Rival"
      elsif single_id == "toughest_conference_place_to_play"
        output_array << "Toughest Conference Place to Play"
      end
    end
    return output_array
  end
end
