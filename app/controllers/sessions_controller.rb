class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      zaloguj user
      redirect_to user
    else
      flash.now[:error] = 'Niepoprawne haslo lub email'
      render 'new'
     end
  end

  def destroy
    wyloguj
    redirect_to root_path
  end

end
