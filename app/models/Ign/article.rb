class Ign::Article

  def self.get_articles
    api = open 'http://ign-apis.herokuapp.com/articles?'
    if api.status.first == "200"
      articles = JSON.parse api.read
    else
      #THROW some error
    end

  end
end