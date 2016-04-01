class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug
end
