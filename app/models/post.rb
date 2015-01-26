class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy

	validates_presence_of :title, :description
	validates_length_of :description, minimum: 8


end
