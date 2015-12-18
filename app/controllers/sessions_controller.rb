class SessionsController < ApplicationController
	def new #login page
	end
	def create #authenticating the login
  		@user = User.find_by_email(params[:session][:email])
  		if @user && @user.authenticate(params[:session][:password])
    			session[:user_id] = @user.id #creating a new session
          redirect_to '/home'
    	else
    			redirect_to '/login' #unsuccessful login
  		end 
	end
  def show
  end
	def destroy  #logout
    		session[:user_id]=nil
    		redirect_to '/'
  	end


end
