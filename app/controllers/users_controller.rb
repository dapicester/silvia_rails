class UsersController < ApplicationController
  before_action :find_user, only: %i(show edit update)

  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :correct_user  , only: %i(edit update)
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t('.welcome')
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t('.updated')
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t('.deleted')
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def find_user
      @user = User.find params[:id]
    end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = t 'users.login'
        redirect_to login_url
      end
    end

    def correct_user
      redirect_to root_url unless current_user? @user
    end

    def admin_user
      redirect_to root_url unless current_user.admin?
    end
end
