require 'open-uri'

class Ign::VideoApi

  def self.get_videos
    api = open 'http://ign-apis.herokuapp.com/videos?'
    if api.status.first == "200"
      videos = JSON.parse api.read

      videos["data"].each do |video|
        Video.where(
            name: video["metadata"]["name"],
            thumbnail: video["thumbnail"],
            description: video["metadata"]["description"],
            title: video["metadata"]["title"],
            longTitle: video["metadata"]["longTitle"],
            duration: video["metadata"]["duration"],
            url: video["metadata"]["url"],
            ageGate: video["metadata"]["ageGate"],
            classification: video["metadata"]["classification"],
            subClassification: video["metadata"]["subClassification"],
            networks: video["metadata"]["networks"],
            noads: video["metadata"]["noads"],
            prime: video["metadata"]["prime"],
            subscription: video["metadata"]["subscription"],
            downloadable: video["metadata"]["downloadable"],
            origin: video["metadata"]["origin"],
            genre: video["metadata"]["genre"],
            state: video["metadata"]["state"],
            slug: video["metadata"]["slug"],
            publishDate: video["metadata"]["publishDate"].to_datetime
        ).first_or_create
      end

     else
      #throw some error
    end
  end

  private

  def isUpdatable?
  end
end