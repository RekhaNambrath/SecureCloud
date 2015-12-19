class User < ActiveRecord::Base
	  
    before_save { self.email = email.downcase }
  	validates :first_name,  presence: true, length: { minimum:5 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, length: { minimum: 10 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :password, presence: true,length: { minimum: 6 }
	has_secure_password
	


end
