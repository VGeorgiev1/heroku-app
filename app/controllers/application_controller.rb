class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  require 'csv'
  require 'linear-regression'
  $foo='Hello!'
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
    sum=0;
    arr=$foo.drop(1).map{|n| n[0]}.reduce{|a, b| a.to_i+b.to_i} 
    render html: arr
  end
  def calcIf
    $foo.drop(1).each do |row|
      if row[1].to_i % 2!=0 
        sum+=row[0].to_i
      end
    end 
    render html: sum
  end 
  def best30
    sum=0
    currow=1
    bestInc=0
   while currow < $foo.length-30 do
      i=0
      while i<30
        sum+=$foo[currow+i][0].to_i;
        i+=1
      end  
      if sum > bestInc
        bestInc=sum
      end 
     p currow
      sum=0;
      currow+=1  
   end
    render html: bestInc
  end 
  def prediction
    ind=(1..$foo.length-1).to_a;
    values=$foo.drop(1).map{|n| n[0].to_i}
    p values.length;
    p ind.length;
    linear = Regression::Linear.new(ind, values);
    predict = linear.predict($foo.length + 1);
    render html: predict
  end  
end
