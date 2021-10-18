module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    # 上のコードを実行すると、ユーザーのブラウザ内の一時cookiesに暗号化済みのユーザーIDが自動で作成されます
    # def current_user
    #     if session[:user_id]
    #         # もし、ブラウザの一時cookies内に[:user_id]存在していたら
    #         @current_user = @current_user || User.find_by(id: session[:user_id])        
    #         # @current_user ||= User.find_by(id: session[:user_id]) ← このようにも書くことができる
    #     end
    # end

    # 記憶トークンcookieに対応するユーザーを返す
    def current_user
        if (user_id = session[:user_id])
        @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
        user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end

    # ユーザーがログインしていればtrue、その他ならfalseを返す
    def logged_in?
        !current_user.nil?
    end

    # ユーザセッションを永続化する
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    # 永続的セッションを破棄する
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    # 現在のユーザーをログアウトする
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end
end
