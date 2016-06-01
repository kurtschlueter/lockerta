class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :sport
      t.string :gender
      t.references :school
      t.references :coach
      t.timestamps null: false
    end
  end
end
