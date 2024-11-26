class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password])
    if user
      flash[:notice] = "ログインしました！"
      redirect_to root_path
    else
      flash.now[:error] = "メールアドレスまたはパスワードが間違っています"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    flash[:notice] = "ログアウトしました！"
    redirect_to root_path, status: :see_other
  end
end
