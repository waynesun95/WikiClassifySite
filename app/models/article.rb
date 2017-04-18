class Article < ApplicationRecord
	#for friendly URLs
	extend FriendlyId
	friendly_id :title, use: :slugged

	#for searching for articles
	def self.search(search)

		#ILIKE for POSTGRESQL

		#where("title ILIKE ?", "%#{search}%")
		where("title LIKE ?", "%#{search}%")
	end

	#list items in drop down menu to sort search results
	SORT_BY = ['Title', 'Category', 'Quality', 'Importance']

end
