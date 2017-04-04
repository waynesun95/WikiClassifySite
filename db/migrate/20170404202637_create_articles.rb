class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :categories
      t.string :cited_domains
      t.string :cited_authors
      t.string :quality
      t.string :importance

      t.timestamps
    end
  end
end
