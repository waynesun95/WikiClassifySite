class AddNearestarticlesToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :nearestarticles, :string
  end
end
