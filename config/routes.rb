Rails.application.routes.draw do
  resources :ec2_instances

  root 'ec2_instances#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
