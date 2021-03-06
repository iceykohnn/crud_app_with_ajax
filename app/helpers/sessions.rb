helpers do
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticated?
  	session[:user_id] != nil
  end
end