class Article < ActiveRecord::Base
  belongs_to :admin
  validates :title, presence: true, uniqueness: true

  def self.article_list
    Article.all
  end
end
