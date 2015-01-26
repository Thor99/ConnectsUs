class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy


	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	scope :confirmed, -> { where.not(created_at: nil) }

	validates_presence_of :name, :age, :about, :email
	validates_numericality_of :age
	validates_length_of :about, :minimum => 15
	validates_uniqueness_of :email
	validates_format_of :email, with: EMAIL_REGEXP

	has_secure_password

	def self.authenticate(email,password)
		confirmed.find_by(email: email).try(:authenticate, password)
	end

end
