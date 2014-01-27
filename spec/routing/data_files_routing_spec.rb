require "spec_helper"

describe DataFilesController do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/data_files/new").to route_to("data_files#new")
    end

    it "routes to #create" do
      expect(:post => "/data_files").to route_to("data_files#create")
    end

    it "routes to #total" do
      expect(:get => "data_files/total").to route_to("data_files#total")
    end

  end
end
