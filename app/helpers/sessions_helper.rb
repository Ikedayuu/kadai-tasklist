module SessionsHelper
  # SessionsHelperを含め、全てのHelperModuleで定義されているメソッドは全てのViewsの中で、呼び出すことができる。
  def current_user
    # current_userを読み込むことで、現在ログインしているUserのインスタンスを取得できる
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end