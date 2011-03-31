module SessionsHelper
  
  def sign_in(user)
    cookies.permanent.signed[:user_cookie] = user.id
    self.current_user = user
  end

  def sign_out
    cookies.delete :user_cookie
    self.current_user = nil
  end

  def signed_in?
    return !current_user.nil?
  end
  
  def current_user=(user)
    @current_user ||= User.find_by_id(cookies.signed[:user_cookie])
  end
  
  def current_user
    @current_user ||= User.find_by_id(cookies.signed[:user_cookie])
  end

end
