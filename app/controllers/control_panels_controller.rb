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
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end
  
  def file_search
  end
  
end
