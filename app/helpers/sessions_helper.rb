module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    # 上のコードを実行すると、ユーザーのブラウザ内の一時cookiesに暗号化済みのユーザーIDが自動で作成されます
end
