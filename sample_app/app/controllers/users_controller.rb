class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # Whenever you’re confused about something in a Rails application, 
    # it’s a good practice to put debugger close to the code you think 
    # might be causing the trouble.
    # debugger
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    # @user = User.new(params[:user])
    # The reason is that initializing the entire params hash is extremely dangerous.
    # It arranges to pass to User.new all data submitted by a user.

    if @user.save
      # Handle a successful save.
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # This code returns a version of the params hash with only the permitted attributes 
  # (while raising an error if the :user attribute is missing).
  # To facilitate the use of these parameters, it’s conventional to introduce an auxiliary 
  # method called user_params (which returns an appropriate initialization hash) and use it 
  # in place of params[:user]:
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
