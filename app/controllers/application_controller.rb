class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout "application"
  protect_from_forgery with: :exception
  helper_method :current_user	
  helper_method :correct_user
  helper_method :same_user
	def current_user #check if current user's session id is registered
  		@current_user ||= User.find(session[:user_id]) if session[:user_id] 
      rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil # or reset_session
  end
	def require_user # checking if user is logged in before redirecting to direct links
  		redirect_to '/sessions/new' unless current_user 
	end
  def correct_user #checking authorization
    @user=User.find(params[:id])
    redirect_to(root_url) unless @user==current_user
  end  
  def same_user
    @user=User.find(params[:id])
    if @user==current_user
      true
    else
      false
    end
  end 
	
include SimpleCaptcha::ControllerHelpers

end
