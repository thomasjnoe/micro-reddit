class User < ActiveRecord::Base
	validates :username, presence: true, length: { maximum: 50 }, 
																			 uniqueness: { case_sensitive: false }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, 
										uniqueness: { case_sensitive: false },
										format: { with: VALID_EMAIL_REGEX }
	has_many :posts
end
