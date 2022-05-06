Rails.application.routes.draw do
  devise_for :companies

  get '/vacancies/all' => 'vacancies#all'

  authenticated :company do
    root to: 'vacancies#index', as: :company_root
  end
  unauthenticated :company do
    root to: 'vacancies#all', as: 'unathenticated_root'
  end
  resources :applicants, only: :create
  
  resources :vacancies do
    resources :applicants, only: %i[index]    
  end
  resources :vacancies
end