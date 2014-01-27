class Purchase < ActiveRecord::Base
  attr_accessible :count, :item_id, :purchaser_id, :merchant_id
  belongs_to :merchant
  belongs_to :purchaser
  belongs_to :item
end
