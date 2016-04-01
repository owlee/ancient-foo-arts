require 'open-uri'

class Ign::ArticleApi

  # Get Articles only if it is within a reasonable time frame from last update.
  def self.get_articles count=20, startIndex=0
    # sometimer to allow updates, user activated Activerecord storing
    api = open "http://ign-apis.herokuapp.com/articles?count=#{count}&startIndex=#{startIndex}"
    if api.status.first == "200"
      articles = JSON.parse api.read

      articles["data"].each do |article|

        post = Post.where(
            thumbnail: article["thumbnail"],
            state: article["metadata"]["state"],
            slug: article["metadata"]["slug"],
            publishDate: article["metadata"]["publishDate"].to_datetime,
            networks: article["metadata"]["networks"]
        ).first_or_create
        if post.nil?
          #break #prevent unnecessary iterations
        else
          a1 = Article.where(
              post_id: post.id,
              headline: article["metadata"]["headline"],
              subHeadline: article["metadata"]["subHeadline"],
              articleType: article["metadata"]["articleType"]
          ).create
          Article.update post.id, _id: 2
        end

      end
    else
      #THROW some error
    end
  end

  private
end