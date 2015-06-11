class User < ActiveRecord::Base
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  validates :full_name, :location, :presence => true
  validates :email, :presence => true,
                    :format => { :with => EMAIL_REGEXP},
                    :uniqueness => true
  validates_length_of :bio, :minimum => 30, :allow_blank => false

  has_secure_password

  before_create :generate_token

  def generate_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm!
    return if confirmed?

    self.confirmed_at = Time.current
    self.confirmation_token = ''
    save!
  end

  def confirmed?
    confirmed_at.present?
  end
end
