class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # 入力されたメールアドレスを持つユーザーがデータベースに存在し、かつ入力されたパスワードがそのユーザーのパスワードである場合↑
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user # ヘルパーメソッド　ユーザーのブラウザ内の一時cookiesに暗号化済みのユーザーIDが自動で作成されます
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
