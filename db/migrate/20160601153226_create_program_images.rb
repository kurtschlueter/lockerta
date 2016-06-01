class CreateProgramImages < ActiveRecord::Migration
  def change
    create_table :program_images do |t|
      t.references :program
      t.attachment :media
      t.timestamps null: false
    end
  end
end
