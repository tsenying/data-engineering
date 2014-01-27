class Merchant < ActiveRecord::Base
  has_many :purchases
  validates_uniqueness_of :name
end
