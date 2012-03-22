class HomeController < ActionController::Base
  def index
    if session[:user]
      @user = session[:user]
    end
  end
end
