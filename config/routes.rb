Rails.application.routes.draw do

  root 'pages#home'
  resources :feedbacks, only: [:new, :create]

end
