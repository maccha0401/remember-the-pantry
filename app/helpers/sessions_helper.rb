module SessionsHelper

  # 渡されたユーザーでログイン
  def log_in(user)
    session[:user_id] = user.id
  end

  # ログアウト
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # ログイン中のユーザー
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ログイン中か確認
  def logged_in?
    !current_user.nil?
  end
end
