class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create show]
  def new
    @user = User.new
  end

  def index
    
  end

  def show
    @user = User.find(params[:id])
    @review = Review.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      flash[:info] = "作成しました！"
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      flash[:info] = "変更しました！"
      redirect_to user_path(user.id)
    else
      flash.now[:error] = "変更に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end
end
