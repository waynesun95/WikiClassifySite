json.extract! article, :id, :title, :categories, :cited_domains, :cited_authors, :quality, :importance, :created_at, :updated_at
json.url article_url(article, format: :json)
