class User < ApplicationRecord
  validates_presence_of :email, :username, :password
  validates_uniqueness_of :email, :username


  has_many :houses
  has_many :favorites

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
