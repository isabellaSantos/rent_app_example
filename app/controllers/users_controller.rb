class UsersController < BaseController

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.role ||= 'user'
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    if params[:user] && params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    attributes = [:name, :email, :password, :password_confirmation]
    attributes << :role if current_user.admin?
    params.require(:user).permit attributes
  end

  def model_class
    User
  end

end