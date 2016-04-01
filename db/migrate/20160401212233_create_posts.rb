class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :thumbnail
      t.string :state
      t.string :slug
      t.datetime :publishDate
      t.string :networks

      t.timestamps null: false
    end
  end
end
