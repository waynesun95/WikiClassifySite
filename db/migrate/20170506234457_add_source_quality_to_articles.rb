class AddSourceQualityToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :source_quality, :string
  end
end
