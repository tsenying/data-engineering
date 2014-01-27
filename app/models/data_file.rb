class DataFile < ActiveRecord::Base
  attr_accessible :file_name, :total

  def process(data_file)
    self.total = 123
  end
end
