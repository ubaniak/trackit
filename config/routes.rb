Trackit::Application.routes.draw do
    # Admin
  get "admin_panal" => "admin#panal"
  get "manage_users" => "admin#users"
  get "manage_departments" => "admin#departments"

    # Tasks
  get "new_task" => "tasks#new"
  post "create_task" => "tasks#create"
  get "tasks/:id/task_path" => "tasks#show", as: :task
  get "tasks/:id/assign_due_date" => "tasks#assign_due_date", as: :assign_due_date
  post "tasks/:id/set_due_date" => "tasks#set_due_date", as: :set_due_date
  get "tasks/:id/cancel_due_date" => "tasks#cancel_due_date", as: :cancel_due_date

    # Users 
  post "create_user" => "user#create"

    # Departments 
  post "create_department" => "departments#create"

    # Comments 
  post "comments/:task_id/add_comment" => "comments#create", as: :add_comment

  devise_for :users

    # Pages 
  get "workspace" => "pages#workspace"
  root "pages#home"
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
