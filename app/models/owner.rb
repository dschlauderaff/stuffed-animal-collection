class Owner < ActiveRecord::Base
  has_many :toys
  has_secure_password
  validates_presence_of :name, :password
end
