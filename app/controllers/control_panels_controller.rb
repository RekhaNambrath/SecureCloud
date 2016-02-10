class ControlPanelsController < ApplicationController

  http_basic_authenticate_with :name => ENV['CP_USER'], :password => ENV['CP_PASSWORD']
  $login_time = DateTime.now
  def index
    @message_count = TpaCsp.where(:status_code =>503).count

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
  end

  def blit_tpa_csp
    @messages = TpaCsp.where(:status_code =>502)

  end
  def blit_tpa_csp_inbox
    @messages = TpaCsp.where(:status_code =>503)

  end


  def delete_message
    @message = TpaCsp.find_by_id(params[:msgid])
    @message.destroy
    redirect_to :controller => 'control_panels', :action => 'blit_tpa_csp'    
  end

  def delete_user
    @user = User.find_by_id(params[:usrid])
    #@user.
    @user.destroy
    redirect_to :controller => 'control_panels', :action => 'user'     
  end
  
end
