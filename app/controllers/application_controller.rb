class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  require 'csv'
  def calculate
     render 'hello'    
  end
  def upload
    file=params[:file].read

    @info = CSV.parse(file)
    
    render 'table'
  end  
  def calc
      p params
      render html: "Hello!"
  end  
end
