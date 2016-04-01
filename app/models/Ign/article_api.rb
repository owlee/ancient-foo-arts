require 'open-uri'
class Ign::ArticleApi

  # Get Articles only if it is within a reasonable time frame from last update.
  def self.get_articles
    # sometimer to allow updates, user activated Activerecord storing
    api = open 'http://ign-apis.herokuapp.com/articles?'
    if api.status.first == "200"
      articles = JSON.parse api.read

      articles["data"].each do |article|
        Article.where(
            headline: article["metadata"]["headline"],
            thumbnail: article["thumbnail"],
            networks: article["metadata"]["networks"],
            state: article["metadata"]["state"],
            slug: article["metadata"]["slug"],
            subHeadline: article["metadata"]["subHeadline"],
            articleType: article["metadata"]["articleType"],
            publishDate: article["metadata"]["publishDate"].to_datetime
        ).first_or_create
      end
    else
      #THROW some error
    end
  end

  private
end