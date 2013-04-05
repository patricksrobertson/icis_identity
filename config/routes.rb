IcisIdentity::Application.routes.draw do
  devise_for :users
  use_doorkeeper

  root :to => 'doorkeeper/applications#index'
end
