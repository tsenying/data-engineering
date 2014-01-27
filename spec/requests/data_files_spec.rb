require 'spec_helper'

describe "DataFiles" do
  describe "GET /data_files" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get data_files_path
      expect(response.status).to be(200)
    end
  end
end
