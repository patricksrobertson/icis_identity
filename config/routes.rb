IcisIdentity::Application.routes.draw do
  devise_for :users
  use_doorkeeper

  namespace :api do
    namespace :v1 do
      get '/me' => "credentials#me"
    end
  end

  root :to => 'doorkeeper/applications#index'
end
