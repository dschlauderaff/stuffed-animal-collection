class Toy < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :variety
end
