class RequestMessage < ActiveRecord::Base
	belongs_to :file_upload
	belongs_to :user
end
