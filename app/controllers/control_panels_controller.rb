class ControlPanelsController < ApplicationController

  http_basic_authenticate_with :name => ENV['CP_USER'], :password => ENV['CP_PASSWORD']
  def index
  end

  def new
  end

  def create
  end

  def destroy
  end

  def file
  	@file_uploads = FileUpload.all
  end

  def user
    @users = User.all
  end
  def user_search
    if params[:search]
      @user = User.find_by_id(params[:search])
    else
      @users = User.all.order('created_at DESC')
    end
  end
  
  def file_search
    @file_uploads = FileUpload.all
    if params[:search]
      @file = FileUpload.find_by_id(params[:search])
    else
      @files = FileUpload.all.order('created_at DESC')
    end
  end

  def send_hash
    @file = FileUpload.find_by_id(params[:fileid])
    @md5 = Digest::MD5.file(@file.attachment.path).hexdigest 
    @message = TpaCsp.create(:status_code=>502, :file_hash=>@md5, :file_upload_id=>@file[:id])
    @message.save
    #Car.create(:type=>'BMW',:colour=>"blue")

    #@file_upload[:hash_val]=@md5
    #@file_upload.save

  end
  
end
