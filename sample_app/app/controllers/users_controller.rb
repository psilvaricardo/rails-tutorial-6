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
  
end
