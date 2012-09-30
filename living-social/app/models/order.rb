class Order < ActiveRecord::Base
  belongs_to :item
  belongs_to :merchant

  validates_presence_of :item, :merchant, :purchaser_name, :purchase_count
  validates_numericality_of :purchase_count
end
