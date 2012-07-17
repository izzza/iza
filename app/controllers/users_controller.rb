class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      zaloguj @user
      flash[:success] = "Witaj!"
      redirect_to @user
      # stworzono usera
    else
      render 'new'
    end
  end

end
