class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :location
      t.string :mascot
      t.string :public_or_private
      t.integer :percentage_male
      t.integer :location_population
      t.integer :tuition
      t.integer :enrollment
      t.timestamps null: false
    end
  end
end
