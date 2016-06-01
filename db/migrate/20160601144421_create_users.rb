class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :jersey_number
      t.string :position
      t.string :password_digest
      t.references :school
      t.string :sport
      t.boolean :admin
      t.timestamps null: false
    end
  end
end
