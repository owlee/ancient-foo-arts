class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :postable, polymorphic: true, index: true
      t.string :thumbnail
      t.string :state
      t.string :slug
      t.datetime :publishDate
      t.string :networks

      t.timestamps null: false
    end
  end
end
