Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	post '/sum' => 'application#sum'
	post '/filters' => 'application#filter'
	post '/intervals' => 'application#interval'
	post '/lin_regressions' => 'application#prediction'
end
