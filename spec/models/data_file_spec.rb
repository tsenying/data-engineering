require 'spec_helper'

describe DataFile do
  it "should process data file" do
    data_file = File.open('spec/data/example_input.tab')
    @data_file = DataFile.new()
    @data_file.process(data_file)
    @data_file.total.should == 95.0
  end
end
