json.array!(@articles) do |article|
  json.extract! article, :id, :title, :content, :admin_id, :writer, :keywords, :published
  json.url article_url(article, format: :json)
end
