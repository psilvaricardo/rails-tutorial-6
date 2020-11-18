
class SessionsController < ApplicationController

  def new
  end

  def create
    # params[:session][:email] has the submitted email address and
    # params[:session][:password] has the submitted password.
    # we already have exactly what we need: the User.find_by method

    # This pulls the user out of the DB using the email address.
    user = User.find_by(email: params[:session][:email].downcase)

    # if user is valid and can be authenticated
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
      render 'new'
    end
  end

  def destroy
  end

end
