class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.string :first_name
      t.attachment :media
      t.string :last_name
      t.string :alma_mater
      t.string :gender
      t.integer :wins
      t.integer :losses
      t.integer :year_started
      t.integer :ncaa_appearances
      t.integer :conference_titles
      t.string :recruiting_state1
      t.string :recruiting_state2
      t.string :recruiting_state3
      t.timestamps null: false
    end
  end
end
