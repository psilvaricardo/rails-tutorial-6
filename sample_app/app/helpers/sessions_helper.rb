module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    # this session helper creates a special kind of cookie
    # It's what I'm gonna call a temporary cookie.

    # We can treat session as if it were a hash, and assign to it as follows:
    session[:user_id] = user.id
  end

end
