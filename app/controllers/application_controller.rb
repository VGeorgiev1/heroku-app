require 'csv'
require 'linear-regression'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_sessions
  skip_before_action :verify_authenticity_token
  def sum
    file=CSV.parse(params[:file].read)
    sum=0;
    sum=file.map{|n| n[0]}.reduce{|a, b|a.to_i+b.to_i} 
    sum=sum.ceil
    render plain: ('%.2f'%sum)  
  end  
  def filter
    file=CSV.parse(params[:file].read)
    sum=0;    
    file.each do |row|
      if row[2].to_i % 2!=0 
        sum+=row[1].to_i
      end
    end 
    sum=sum.ceil
    render plain: '%.2f'%sum
  end 
  def interval
    sum=0
    currow=0
    bestInc=0
    file=CSV.parse(params[:file].read)
    if file.length<30
      sum=file.map{|n| n[0]}.reduce{|a, b|a.to_i+b.to_i} 
      render plain: '%.2f' % sum
    else  
    while currow < file.length-29 do
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
    bestInc=bestInc.ceil
      render plain: '%.2f' % bestInc
    end  
  end 
  def prediction
    file=CSV.parse(params[:file].read)
    ind=(1..file.length).to_a;
    values=file.map{|n| n[0].to_i}
    p values.length;
    p ind.length;
    linear = Regression::Linear.new(ind, values);
    b = linear.intercept;
    a = linear.slope;
    
    render plain: "#{'%.6f' % a},#{'%.6f' % b}"
  end  
end