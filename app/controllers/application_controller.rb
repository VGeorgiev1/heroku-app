class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require 'csv'
  def calculate
     render 'hello'    
  end
  def upload
    file=params[:file].read

    @info = CSV.parse(file)
    
    render 'table'
  end  
end
