class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    ## Not the final implementation
    @user = User.new(user_params)   
    if @user.save
      flash[:success] = "Welcome to the Zen Blog"
      redirect_to @user
      ##create users/create.html.erb to make this work!! holy shit! that sucked.
      #redirect_to :action => :index #Handle a successful save -> change this later.
    else
      render 'new'
    end
  end
  
  private
  
      def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
end