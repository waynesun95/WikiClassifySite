class Article < ApplicationRecord
	#for friendly URLs
	extend FriendlyId
	friendly_id :title, use: :slugged

	#for searching for articles
	def self.search(search)
		where("title LIKE ?", "%#{search}%")
	end

end
