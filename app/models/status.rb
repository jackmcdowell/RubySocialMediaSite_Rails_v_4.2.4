class Status < ActiveRecord::Base
	# attr_accessible :content
	# attr_accessible :user_id
	belongs_to :user
end
