module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    # this session helper creates a special kind of cookie
    # It's what I'm gonna call a temporary cookie.

    # We can treat session as if it were a hash, and assign to it as follows:
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end
