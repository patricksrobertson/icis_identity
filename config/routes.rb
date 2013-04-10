IcisIdentity::Application.routes.draw do
  devise_for :users
  use_doorkeeper

  namespace :api do
    namespace :v1 do
      get '/me' => "credentials#me"
      resource :verify, only: ['show']
    end
  end

  root :to => 'doorkeeper/applications#index'
end
