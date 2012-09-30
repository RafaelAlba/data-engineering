class Item < ActiveRecord::Base
  validates_presence_of :description, :price
  validates_numericality_of :price
end
