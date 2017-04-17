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

end
