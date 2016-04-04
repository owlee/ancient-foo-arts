class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug
  belongs_to :postable, polymorphic: true

  def publish_age
    binding.pry
    age = Hash.new
    age[:sec] = Time.now - self.publishDate
    age[:hour] = age[:sec]/60
    age[:day] = age[:sec]/3600
    age
  end
end
