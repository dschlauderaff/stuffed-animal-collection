class User < ActiveRecord::Base
  has_many :toys
  has_secure_password
  validates_presence_of :name, :password
  validates :name, uniqueness: true
end
