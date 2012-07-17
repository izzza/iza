module SessionsHelper

  def zaloguj(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def wyswietl
    puts user
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

  def wyloguj
    self.current_user = nil
    cookies.delete(:remember_token)
  end

end
