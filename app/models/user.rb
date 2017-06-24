class User < ActiveRecord::Base
  has_many :stuffed_animals
  has_secure_password
  validates_presence_of :name, :password
end
