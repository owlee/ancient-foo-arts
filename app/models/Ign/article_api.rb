require 'open-uri'

class Ign::ArticleApi

  # Get Articles only if it is within a reasonable time frame from last update.
  def self.get_articles count=20, startIndex=0
    # sometimer to allow updates, user activated Activerecord storing
    api = open "http://ign-apis.herokuapp.com/articles?count=#{count}&startIndex=#{startIndex}"
    if api.status.first == "200"
      articles = JSON.parse api.read

      articles["data"].each do |article|

        a1 = Article.where(
            headline: article["metadata"]["headline"],
            subHeadline: article["metadata"]["subHeadline"],
            articleType: article["metadata"]["articleType"]
        ).first_or_create

        if a1.nil?
          #break #prevent unnecessary iterations
        else
          post = Post.where(
              thumbnail: article["thumbnail"],
              state: article["metadata"]["state"],
              slug: article["metadata"]["slug"],
              publishdate: article["metadata"]["publishDate"].to_datetime,
              networks: article["metadata"]["networks"],
              postable_type: a1.class,
              postable_id: a1.id).first_or_create

          raise 'Post already Exists, this case should not happen.' if post.nil?

          # note to self
          # Article.first.post == Post.first.postable
        end
      end
    else
      #THROW some error
    end
  end

  private
end
