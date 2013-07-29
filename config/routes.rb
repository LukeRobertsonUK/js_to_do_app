JsToDoApp::Application.routes.draw do
  devise_for :users

  resources :to_do_items do
    member do
      put 'move/:direction', to: 'to_do_items#move_in_list', as: 'move_in_list'
      post :update_position, to: 'to_do_items#update_position'
      post :update_list_and_position, to: 'to_do_items#update_list_and_position'
    end
  end

  resources :to_do_lists

  root to: 'to_do_lists#index'


end
