Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	root 'application#calculate'
	post '/upload' => 'application#upload'
	get '/calc' => 'application#calc'
	get '/calcIf' => 'application#calcIf'
	get '/best30' => 'application#best30'
	get '/predict' => 'application#prediction'
end
