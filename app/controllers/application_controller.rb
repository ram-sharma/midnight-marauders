class ApplicationController < ActionController::Base

  protect_from_forgery
  rescue_from User::NotAuthorized, :with => :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = "You don't have the right authorization to access this"
    redirect_to :back
  end
end
