class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def calculate
     a=params[:a].to_i
     b=params[:b].to_i	
     c=params[:c].to_i

     d=b*b-4*a*c
     if(d<0)
       render html: "No real solutions"
     else 
        x1=(-b+Math.sqrt(d))/2*a
        x2=(-b-Math.sqrt(d))/2*a
        render html: "x1->#{x1} x2->#{x2}"    
     end
         
  end
end
