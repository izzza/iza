class UsersController < ApplicationController
   before_filter :zalogowany_user, only: [:edit, :update]
   before_filter :correct_user,   only: [:edit, :update]
   before_filter :admin_user,     only: :destroy

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.paginate(per_page: 10, page: params[:page])
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

  def edit
    #@user = User.find(params[:id])
  end

  def index
    @users = User.paginate(per_page: 10, page: params[:page])
  end

  def update
    #@user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      zaloguj @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Uzytkownik skasowany."
    redirect_to users_path
  end

  private

    # sprawdza czy zalogowany przy : edit i update
    def zalogowany_user
      unless zalogowany?
        pamietaj_lokalizacje
        redirect_to loguj_path, notice: "Zaloguj sie."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
