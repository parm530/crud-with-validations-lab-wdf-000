Rails.application.routes.draw do
  get '/', to: "songs#index", as: 'songs'
  resources :songs, except: :index
end
