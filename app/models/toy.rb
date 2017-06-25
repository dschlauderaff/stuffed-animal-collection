class Toy < ActiveRecord::Base
  belongs_to :owner
  validates_presence_of :name, :variety
end
