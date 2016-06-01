class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :coach
      t.references :school
      t.references :program

      t.integer :hc_player_relationships
      t.integer :hc_player_development
      t.integer :hc_recruiting
      t.integer :hc_pro_connections
      t.integer :hc_sport_knowledge
      t.boolean :hc_would_play_with_again
      t.text :hc_comments

      t.integer :f_main_arena
      t.integer :f_home_atmosphere
      t.integer :f_weight_room
      t.integer :f_locker_room
      t.integer :f_training_facility
      t.text :f_comments

      t.integer :l_program_tradtion
      t.integer :l_community_interest
      t.integer :l_weather
      t.integer :l_nightlife
      t.text :l_comments

      t.integer :e_school_difficulty
      t.integer :e_academic_support
      t.integer :e_school_reputation
      t.boolean :e_graduated
      t.text :e_comments

      t.string :conference_rival
      t.string :toughest_conference_place_to_play
      t.timestamps null: false
    end
  end
end
