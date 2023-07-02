Rails.application.routes.draw do
  root to: 'homes#top'
  get '/' => 'homes#top'
  resources :books
end
