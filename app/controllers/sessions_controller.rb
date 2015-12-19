class SessionsController < ApplicationController
  def index
    @user=User.all
  end
	def new #login page
	end
	def create #authenticating the login
  		@user = User.find_by_email(params[:session][:email])
  		if @user && @user.authenticate(params[:session][:password])
    			session[:user_id] = @user.id #creating a new session
          redirect_to action: 'show', id: @user.id
    	else
          flash[:danger] = 'Invalid email/password combination' 
          render 'new' #unsuccessful login
  		end 
	end
  def show
    @user=User.find(params[:id])
  end
	def destroy  #logout
    		session[:user_id]=nil
    		redirect_to '/'
  	end


end
