class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def calculate
     a=params[:a].to_i
     b=params[:b].to_i			
     render 'hello'
  end
end
