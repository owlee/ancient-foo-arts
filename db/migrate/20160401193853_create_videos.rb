class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :thumbnail
      t.text :description
      t.string :title
      t.string :longTitle
      t.integer :duration
      t.string :url
      t.string :ageGate
      t.string :classification
      t.string :subClassification
      t.string :networks
      t.boolean :noads
      t.boolean :prime
      t.boolean :subscription
      t.boolean :downloadable
      t.string :origin
      t.string :genre
      t.string :state
      t.string :slug
      t.datetime :publishDate

      t.timestamps null: false
    end
  end
end
