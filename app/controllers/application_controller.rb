class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  require 'csv'
  $foo='Hello!';
  def calculate
     render 'hello'    
  end
  def upload
    file=params[:file].read

    @info = CSV.parse(file)
    $foo=@info
    render 'table'
  end  
  def calc
    col=params[:selected]

    index=$foo[0].index(col)
    sum=0;
    $foo.drop(1).each do |row|
      sum+=row[index].to_i
    end  
      render html: sum
  end  
end
