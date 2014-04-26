class Article < ActiveRecord::Base


  def self.article_list
    Article.all
  end
end
