require 'spec_helper'

describe "data_files/new" do
  before(:each) do
    assign(:data_file, stub_model(DataFile,
      :file_name => "MyString",
      :total => 1.5
    ).as_new_record)
  end

  it "renders new data_file form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", data_files_path, "post" do
      assert_select "input#data_file_data_file[name=?]", "data_file[data_file]"
    end
  end
end
