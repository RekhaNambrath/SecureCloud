class UsersController < ApplicationController
  before_filter :require_user, only: [:show,:update,:edit]
  def index
    @user=User.all
  end
	def new #adding a new entry in database
		@user=User.new

	end
	def create 
        @user=User.new(user_params) #updating the database fields for new entry
        if simple_captcha_valid?
    		  if @user.save
      			session[:user_id]=@user.id #new session for the user
      			redirect_to action: 'show', id: @user.id
    		  else
      			render 'new' #if signup was unsuccessfull
    		  end
        else
          flash[:error]="Entered captcha was wrong"
          render 'new'
        end
  end
	
  def show
    @user=User.all
    @user=User.find(params[:id])
  end
  def edit
    @user=User.find(params[:id])
  end 
  def update
  end
  def destroy
    redirect_to '/sessions/destroy'
  end
  private 
    def user_params #which parameters are required and which ones are permitted.
        params.require(:user).permit(:first_name,:last_name, :email, :password,:date_of_birth,:gender,:captcha,:captcha_key) 
    end
  
end
