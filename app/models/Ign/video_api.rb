require 'open-uri'

class Ign::VideoApi

  def self.get_videos count=20, startIndex=0
    api = open "http://ign-apis.herokuapp.com/videos?count=#{count}&startIndex=#{startIndex}"
    if api.status.first == "200"
      videos = JSON.parse api.read

      videos["data"].each do |video|

        v1 = Video.where(
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
        ).first_or_create

        if v1.nil?
          #break #prevent unnecssary iterations
        else
          post = Post.where(
              thumbnail: video["thumbnail"],
              state: video["metadata"]["state"],
              slug: video["metadata"]["slug"],
              publishdate: video["metadata"]["publishDate"].to_datetime,
              networks: video["metadata"]["networks"],
              postable_type: v1.class,
              postable_id: v1.id
          ).first_or_create

          raise 'Post already Exists, this case should not happen.' if post.nil?

          # note to self
          # Video.first.post == Post.first.postable
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
