class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :headline
      t.string :subHeadline
      t.string :articleType

      t.timestamps null: false
    end
  end
end
