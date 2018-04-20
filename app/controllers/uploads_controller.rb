class UploadsController < ApplicationController
   def index
     @uploads = Upload.all
   end
   def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.create(upload_params)
    if @upload.save
      # send success header
      render json: { message: "success", fileID: @upload.id }, :status => 200
    else
      #  you need to send an error header, otherwise Dropzone
      #  will not interpret the response as an error:
      render json: { error: @upload.errors.full_messages.join(',')}, :status => 400
    end     
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    redirect_to uploads_path
  end

  private
  def upload_params
    params.require(:upload).permit(:image,:image_file_name,:image_content_type)
  end
end
