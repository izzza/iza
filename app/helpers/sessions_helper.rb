module SessionsHelper

  def zaloguj(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end



  def zalogowany?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user?(user)
    user == current_user
  end

  def wyloguj
    self.current_user = nil
    cookies.delete(:remember_token)
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def pamietaj_lokalizacje
    session[:return_to] = request.fullpath
  end


end
