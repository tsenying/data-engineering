class DataFile < ActiveRecord::Base

  def process(data_file)
    data_file.readline # skip header line

    self.total = 0
    data_file.each do |line|
      fields = line.split(/\t/);
      self.total += fields[2].to_f * fields[3].to_i

      purchase = Purchase.new(:count => fields[3])
      purchase.purchaser = Purchaser.where(:name => fields[0]).first_or_create
      purchase.merchant = Merchant.where(:name => fields[5], :address => fields[4]).first_or_create
      purchase.item = Item.where(:description => fields[1], :price => fields[2]).first_or_create

      purchase.save
    end

  end
end
