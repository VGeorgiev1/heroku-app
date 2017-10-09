require 'csv'
require 'linear-regression'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_sessions
  skip_before_action :verify_authenticity_token
  def sum
    #file=CSV.parse(params[:file].read)
    sum=0;
    sum=file.drop(1).map{|n| n[0]}.reduce{|a, b|a.to_i+b.to_i} 
    render plain: sum  
  end  
  def filter
    file=CSV.parse(params[:file].read)
    sum=0;    
    file.drop(1).each do |row|
      if row[1].to_i % 2!=0 
        sum+=row[0].to_i
      end
    end 
    render plain: sum
  end 
  def interval
    sum=0
    currow=1
    bestInc=0
    file=CSV.parse(params[:file].read)
   while currow < file.length-30 do
      i=0
      while i<30
        sum+=file[currow+i][0].to_i;
        i+=1
      end  
      if sum > bestInc
        bestInc=sum
      end 
      sum=0;
      currow+=1  
   end
    render plain: bestInc
  end 
  def prediction
    file=CSV.parse(params[:file].read)
    ind=(1..file.length-1).to_a;
    values=file.drop(1).map{|n| n[0].to_i}
    p values.length;
    p ind.length;
    linear = Regression::Linear.new(ind, values);
    b = linear.intercept;
    a = linear.slope;
    render plain: "#{a},#{b}"
  end  
end
