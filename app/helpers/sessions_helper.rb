module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    # 上のコードを実行すると、ユーザーのブラウザ内の一時cookiesに暗号化済みのユーザーIDが自動で作成されます
    def current_user
        if session[:user_id]
            @current_user = @current_user || User.find_by(id: session[:user_id])        
            # @current_user ||= User.find_by(id: session[:user_id]) ← このようにも書くことができる
        end
    end

    # ユーザーがログインしていればtrue、その他ならfalseを返す
    def logged_in?
        !current_user.nil?
    end

    # 現在のユーザーをログアウトする
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
