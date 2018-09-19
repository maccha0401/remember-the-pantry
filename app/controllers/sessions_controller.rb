class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = '入力されたメールアドレスかパスワードが正しくありません。'
      render 'new'
    end
  end
  def destroy
    log_out if logged_in?
    flash.now[:notice] = 'ログアウトしました'
    redirect_to '/login'
  end
end
