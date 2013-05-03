require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :photos
  has_many :albums

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password) 
    user = User.where("email = ?", email).first
    if user && user.password == password
      user 
    else
      nil  
    end
  end
end
