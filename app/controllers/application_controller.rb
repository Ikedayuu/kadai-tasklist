class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # include Moduleを使用することで、そのModule内で定義された全てのメソッドを、
  # そのクラス内のインスタンスメソッドとして定義することができる。
  # 簡単に言うと、Module内の全てのメソッドをコピペするようなものである。
  # これをMix-inという、Lesson5-11で学んだ。
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

end