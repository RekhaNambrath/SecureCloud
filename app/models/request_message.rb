class RequestMessage < ActiveRecord::Base
	belongs_to :user
	belongs_to :file_upload
end
