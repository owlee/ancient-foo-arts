class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug
  belongs_to :postable, polymorphic: true

  def publish_age_less
    @age ||= publish_age

    if @age[:day] > 0
      if @age[:day] == 1
        html = "#{@age[:day]} day ago"
      else
        html = "#{@age[:day]} days ago"
      end
    elsif post.publish_age[:hour] > 0
      if @age[:hour] == 1
        html = "#{@age[:hour]} hour ago"
      else
        html = "#{@age[:hour]} hours ago"
      end
    elsif post.publish_age[:min] > 0
      if @age[:day] == 1
        html = "#{@age[:min]} min ago"
      else
        html = "#{@age[:min]} mins ago"
      end
    else
      if @age[:sec] == 1
        html = "#{@age[:sec]} sec ago"
      else
        html = "#{@age[:sec]} secs ago"
      end
    end
    html
  end


  private
  def publish_age
    @age = Hash.new
    sec = Time.now - self.publishDate

    @age[:day] = (sec/(24*60*60)).floor
    t1 = sec/(24*60*60) - @age[:day]
    @age[:hour] = (t1*24).floor
    t2 = (t1*24) - @age[:hour]
    @age[:min] = (t2*60).floor
    t3 = (t2*60) - @age[:min]
    @age[:sec] = (t3*60).floor
    @age
  end
end
