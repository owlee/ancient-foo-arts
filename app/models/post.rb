class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug
  belongs_to :postable, polymorphic: true

  def publish_age_less
    @age ||= publish_age

    if @age[:day] > 0
      if @age[:day] == 1
        puts "#{@age[:day]} day ago"
      else
        puts "#{@age[:day]} days ago"
      end
    elsif post.publish_age[:hour] > 0
      if @age[:hour] == 1
        puts "#{@age[:hour]} hour ago"
      else
        puts "#{@age[:hour]} hours ago"
      end
    elsif post.publish_age[:min] > 0
      if @age[:day] == 1
        puts "#{@age[:min]} min ago"
      else
        puts "#{@age[:min]} mins ago"
      end
    else
      if @age[:sec] == 1
        puts "#{@age[:sec]} sec ago"
      else
        puts "#{@age[:sec]} secs ago"
      end
    end
  end


  private
  def publish_age
    @age = Hash.new
    sec = Time.now - self.publishDate

    @age[:day] = (sec/(24*60*60)).floor
    t1 = sec/(24*60*60) - age[:day]
    @age[:hour] = (t1*24).floor
    t2 = (t1*24) - age[:hour]
    @age[:min] = (t2*60).floor
    t3 = (t2*60) - age[:min]
    @age[:sec] = (t3*60).floor
    @age
  end
end
