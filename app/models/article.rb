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

	#delimit the categories by "|" so we can list it nicer on html view
	attr_accessor :delimited_categories
	attr_accessor :delimited_domains
	attr_accessor :delimited_authors
	attr_accessor :delimited_nearestarticles
	#attr_accessor :closest_articles


end
