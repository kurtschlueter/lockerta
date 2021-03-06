class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.references :user
      t.attachment :media
      t.timestamps null: false
    end
  end
end
