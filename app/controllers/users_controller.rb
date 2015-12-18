class UsersController < ApplicationController
	def new #adding a new entry in database
		@user=User.new

	end
	def create 
        @user=User.new(user_params) #updating the database fields for new entry
    		if @user.save
      			session[:user_id]=@user.id #new session for the user
      			redirect_to '/users/show'
    		else
      			redirect_to 'signup' #if signup was unsuccessfull
    		end
  end
	private
    def user_params #checks whether all the required parameters are present and collects them
        params.require(:user).permit(:first_name,:last_name, :email, :password) #permit returns true if all these values 
                                                                                 #are permitted to be entered into db 
    end
  def show
    @user=User.find(params[:id])
  end
  def update
  end
  def destroy
    redirect_to '/sessions/destroy'
  end
  
end
