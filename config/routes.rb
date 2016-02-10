Rails.application.routes.draw do



  resources :password_resets,     only: [:new, :create, :edit, :update]

  get 'tpa/new'

  get 'tpa/create'

  get 'tpa/edit'

  get 'tpa/update'

  get 'tpa/destroy'

  get 'tpa/audit'


  resources :tpa

  get 'uploads' => 'file_uploads#index'
  get 'control_panel' => 'control_panels#index'
  resource :control_panel, only: [:index, :new, :create, :destroy]
  resource :control_panel do
    get 'user_search'
    get 'file_search'
    get 'file'
    get 'user'
  end
  #get 'admin' => 'control_panel#index'
  #get '/admin/files' => 'control_panel#file'
  #get '/admin/users' => 'control_panel#user'
  root 'static_pages#home'
  get 'static_pages/about'
  get 'static_pages/help'
  get 'login'=> 'sessions#new'
  post 'login' => 'sessions#create'
  #get 'tpa' => 'pages#tpa'
  delete 'logout'=> 'sessions#destroy'
  resources :users do 
    get '/messages'=>'users#showMessages'
    resources :file_uploads do
      get '/send_hash'=>'file_uploads#send_hash'
      get '/audit'=>'file_uploads#audit'
    end

  end
  resources :sessions
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
