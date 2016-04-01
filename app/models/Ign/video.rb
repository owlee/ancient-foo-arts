class Ign::Video

  def self.get_videos
    api = open 'http://ign-apis.herokuapp.com/videos?'
    if api.status.first == "200"
      videos = JSON.parse api.read
    else
      #throw some error
    end

  end
end