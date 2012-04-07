class HomeController < ApplicationController
  def index
    if session[:user]
      @user = session[:user]
    end
  end
end
