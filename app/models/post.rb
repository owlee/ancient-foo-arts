class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug
  belongs_to :postable, polymorphic: true

  def publish_age
    age = Hash.new
    sec = Time.now - self.publishDate

    age[:day] = (sec/(24*60*60)).floor
    t1 = sec/(24*60*60) - age[:day]
    age[:hour] = (t1*24).floor
    t2 = (t1*24) - age[:hour]
    age[:min] = (t2*60).floor
    t3 = (t2*60) - age[:min]
    age[:sec] = (t3*60).floor
    age
  end
end
