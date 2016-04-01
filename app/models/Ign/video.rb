class Ign::Video < ActiveRecord::Base

  def self.get_videos
    api = open 'http://ign-apis.herokuapp.com/videos?'
    videos = JSON.parse api.read
  end
end