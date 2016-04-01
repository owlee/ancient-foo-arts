class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :post, index: true
      t.string :headline
      t.string :subHeadline
      t.string :articleType

      t.timestamps null: false
    end
  end
end
