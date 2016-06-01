class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|

      t.timestamps null: false
    end
  end
end
