class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :thumbnail
      t.string :headline
      t.string :networks
      t.string :state
      t.string :slug
      t.string :subHeadline
      t.string :articleType
      t.datetime :publishDate

      t.timestamps null: false
    end
  end
end
