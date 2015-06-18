Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :advertisement
  resources :posts
  # get: read all
  # post: create
  # get: read
  # put: update
  # delete: destroy

  get 'about' => 'welcome#about'
end
