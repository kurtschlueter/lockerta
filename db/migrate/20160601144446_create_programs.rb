class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :sport
      t.string :gender
      t.string :facility_name
      t.integer :facility_capacity
      t.string :gear
      t.string :rivals
      t.string :conference
      t.string :record_last_season
      t.integer :national_titles
      t.integer :conference_titles
      t.string :website
      t.references :school
      t.references :coach
      t.timestamps null: false
    end
  end
end
