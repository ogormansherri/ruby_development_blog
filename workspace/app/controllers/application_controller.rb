class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception <- May need this line
  
  http_basic_authenticate_with name: "jasmine", password: "balcony", except: [:index, :show]
  
  def index
    @articles = Article.all
  end
end