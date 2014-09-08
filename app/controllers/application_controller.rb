class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_filter :the_blog

  def the_blog
    @blogs = Blog.all
  end

  def current_user
    @current_user ||= User.find(session[:email]) if session[:email]
  end
  helper_method :current_user
end
