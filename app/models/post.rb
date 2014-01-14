class Post < ActiveRecord::Base
	
	#dependent option deletes a post and its associated comments
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
		length: {minimum: 5}
end
