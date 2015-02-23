class Post < ActiveRecord::Base
	extend FriendlyId

	belongs_to :user
	has_many :comments, dependent: :destroy

	validates_presence_of :title, :description, :slug
	validates_length_of :description, minimum: 8

	friendly_id :title, use: [:slugged, :history]

	def self.search(query)
		if query.present?
			where(['title LIKE :query OR description LIKE :query', query: "%#{query}%"])
		else
			all
		end
	end

end
