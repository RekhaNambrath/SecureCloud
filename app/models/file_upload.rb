class FileUpload < ActiveRecord::Base
	 mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
   validates :owner, presence: true # Make sure the owner's name is present.
   validates :fname, presence: true 
   validates :ftype, presence: true 
   validates :keywords, presence: true 
   belongs_to :user
end
