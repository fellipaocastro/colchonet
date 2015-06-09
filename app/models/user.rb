class User < ActiveRecord::Base
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  validates :full_name, :location, :presence => true
  validates :email, :presence => true,
                    :format => { :with => EMAIL_REGEXP},
                    :uniqueness => true
  validates_length_of :bio, :minimum => 30, :allow_blank => false

  has_secure_password
end
