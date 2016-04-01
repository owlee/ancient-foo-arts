class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug

  has_one :article
  has_one :video
end
