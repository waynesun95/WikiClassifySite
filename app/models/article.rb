class Article < ApplicationRecord
	#for friendly URLs
	extend FriendlyId
	friendly_id :title, use: :slugged

end
