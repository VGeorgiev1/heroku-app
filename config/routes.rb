Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	root 'application#calculate'
	post '/upload' => 'application#upload'
	post '/calcCol' => 'application#calc'
end
