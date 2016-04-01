class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug
  belongs_to :postable, polymorphic: true
end
