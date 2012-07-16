class UsersController < ApplicationController
  def show
<<<<<<< HEAD
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Witaj!"
      redirect_to @user
      # stworzono usera
=======
      @user = User.find(params[:id])
  end

  def new
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
>>>>>>> rejestracja
    else
      render 'new'
    end
  end

end
