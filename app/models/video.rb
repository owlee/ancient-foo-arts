class Video < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug
end
