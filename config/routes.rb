JsToDoApp::Application.routes.draw do
  resources :to_do_items do
    member do
      put 'move/:direction', to: 'to_do_items#move_in_list', as: 'move_in_list'
    end
    post 'to_do_items/update_position', to: 'to_do_items#update_position'
  end

  resources :to_do_lists

  root to: 'to_do_lists#index'


end
