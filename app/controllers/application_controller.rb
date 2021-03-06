class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_filter :the_blog

  def the_blog
    @blogs = Blog.all
  end

end
