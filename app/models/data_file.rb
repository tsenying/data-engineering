class DataFile
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :data_file, :total

  validates_presence_of :data_file, :message => "must be chosen"

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def new_record?
    true
  end

  def process(uploaded_file)
    uploaded_file.readline # skip header line

    self.total = 0
    uploaded_file.each do |line|
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
