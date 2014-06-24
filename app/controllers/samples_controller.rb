require 'base64'
class SamplesController < ApplicationController
#respond_to :json
  # GET /samples
  # GET /samples.json
  def index
	
#	respond_with Sample.all
    @samples = Sample.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @samples }
    end
  end


def update_pic
     
    @sample = Sample.find(params[:id])
   data = params[:data_url]

image_data = Base64.decode64(data['data:image/jpg;base64,'.length .. -1])

File.open("#{Rails.root}/public/#{@sample.pic}", 'wb') do |f|
  f.write image_data
end

end
  # GET /samples/1
  # GET /samples/1.json
  def show
	
#	 respond_with Sample.find(params[:id])
    @sample = Sample.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sample }
    end
  end

  # GET /samples/new
  # GET /samples/new.json
  def new
    @sample = Sample.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sample }
    end
  end

  # GET /samples/1/edit
  def edit
    @sample = Sample.find(params[:id])
  end

  # POST /samples
  # POST /samples.json
  def create
    params[:sample][:left]=0
    params[:sample][:top]=0
    @sample = Sample.new(params[:sample])
#    @sample.left=0
#    @sample.top=0
    respond_to do |format|
      if @sample.save
        format.html { redirect_to @sample, notice: 'Image is successfully Uploaded.' }
        format.json { render json: @sample, status: :created, location: @sample }
      else
        format.html { render action: "new" }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /samples/1
  # PUT /samples/1.json
  def update
    @sample = Sample.find(params[:id])

    respond_to do |format|
      if @sample.update_attributes(params[:sample])
        format.html { redirect_to @sample, notice: 'Image is successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /samples/1
  # DELETE /samples/1.json
  def destroy
    @sample = Sample.find(params[:id])
    @sample.destroy

    respond_to do |format|
      format.html { redirect_to samples_url }
      format.json { head :no_content }
    end
  end
end
