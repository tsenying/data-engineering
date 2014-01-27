class DataFilesController < ApplicationController
  # GET /data_files/new
  def new
    @data_file = DataFile.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /data_files
  def create
    @data_file = DataFile.new(params[:data_file])

    if @data_file.valid?
      uploaded_io = params[:data_file][:data_file]
      @data_file.process(uploaded_io.tempfile)
    end

    respond_to do |format|
      unless @data_file.errors.count > 0
        format.html { redirect_to data_files_total_path, notice: "Total=#{@data_file.total}" }
      else
        format.html { render action: "new" }
      end
    end
  end
end
