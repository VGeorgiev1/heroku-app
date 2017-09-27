class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def calculate
     render "hello"    
  end
end
