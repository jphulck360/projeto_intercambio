Rails.application.routes.draw do
  
  get 'visitors/index'
  get 'users/user'
  get 'schedules/menu_agendamento'
  #get 'schedules/busca_normal'
  #get 'schedules/busca_personalizada'
  get 'course_universities/busca_normal'
  get 'course_universities/busca_personalizada'

  resources :period_universities
  resources :schedules
  resources :periods
  resources :country_languages
  resources :country_continents
  resources :city_universities
  resources :country_climates
  resources :course_universities
  resources :languages
  resources :climates
  resources :continents
  resources :countries
  resources :cities
  resources :universities
  resources :courses
  resources :costs
  resources :students

  root to: 'visitors#index' # Página inicial

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
