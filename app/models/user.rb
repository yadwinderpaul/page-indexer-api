class User < ApplicationRecord

  # attribute properties
  attr_accessor :password

  # model event listeners
  before_save :generate_password_hash

  # validations
  validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..40 }
  validates :password, :confirmation => true #password_confirmation attr
  validates_length_of :password, :in => 4..20, :on => :create

  # custom methods
  def self.authenticate(name, password)
    user = User.find_by_name(name)
    if user && user.password_check(password)
      return user
    else
      return false
    end
  end

  def password_check(test_password)
    password_hash == BCrypt::Engine.hash_secret(test_password, salt)
  end

  # event listener definitions
  def generate_password_hash
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, salt)
    end
  end

end
