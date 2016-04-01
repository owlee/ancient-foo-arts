require 'open-uri'

class Ign::VideoApi

  def self.get_videos count=20, startIndex=0
    api = open "http://ign-apis.herokuapp.com/videos?count=#{count}&startIndex=#{startIndex}"
    if api.status.first == "200"
      videos = JSON.parse api.read

      videos["data"].each do |video|

        post = Post.where(
            thumbnail: video["thumbnail"],
            state: video["metadata"]["state"],
            slug: video["metadata"]["slug"],
            publishDate: video["metadata"]["publishDate"].to_datetime,
            networks: video["metadata"]["networks"]
        ).first_or_create

        if post.nil?
          #break #prevent unnecssary iterations
        else
          Video.where(
              post_id: post.id,
              name: video["metadata"]["name"],
              description: video["metadata"]["description"],
              title: video["metadata"]["title"],
              longTitle: video["metadata"]["longTitle"],
              duration: video["metadata"]["duration"],
              url: video["metadata"]["url"],
              ageGate: video["metadata"]["ageGate"],
              classification: video["metadata"]["classification"],
              subClassification: video["metadata"]["subClassification"],
              noads: video["metadata"]["noads"],
              prime: video["metadata"]["prime"],
              subscription: video["metadata"]["subscription"],
              downloadable: video["metadata"]["downloadable"],
              origin: video["metadata"]["origin"],
              genre: video["metadata"]["genre"],
          ).create
        end
      end
    else
      #throw some error
    end
  end

  private

  def isUpdatable?
  end
end