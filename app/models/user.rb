class User < ActiveRecord::Base
	 attr_accessor :reset_token
  before_save { self.email = email.downcase }
  validates :first_name,  presence: true, length: { minimum:3 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 10 },format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	has_many :file_uploads, :dependent => :destroy
  	has_many :request_messages, :dependent => :destroy
   # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  #Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  has_many :request_messages, :dependent => :destroy


  def self.search(search)
    if search
       self.where("name like ?", "%#{search}%")
    else
       self.all
    end
 end
end


