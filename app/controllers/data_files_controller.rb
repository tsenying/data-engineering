class DataFilesController < ApplicationController

  # GET /data_files/new
  # GET /data_files/new.json
  def new
    @data_file = DataFile.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /data_files
  # POST /data_files.json
  def create
    @data_file = DataFile.new(params[:data_file])

    respond_to do |format|
      if @data_file.save
        format.html { redirect_to @data_file, notice: 'Data file was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

end
