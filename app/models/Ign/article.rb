class Ign::Article < ActiveRecord::Base

  def self.get_articles
    api = open 'http://ign-apis.herokuapp.com/articles?'
    articles = JSON.parse api.read
  end
end