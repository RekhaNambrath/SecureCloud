class User < ActiveRecord::Base
	  
  before_save { self.email = email.downcase }
  validates :first_name,  presence: true, length: { minimum:3 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 10 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	has_many :file_uploads, :dependent => :destroy
  def self.search(search)
  if search
    self.where("name like ?", "%#{search}%")
  else
    self.all
  end
end

end
