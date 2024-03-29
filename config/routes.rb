Trackit::Application.routes.draw do
    # Admin
  get "admin_panal" => "admin#panal"
  get "manage_users" => "admin#users"
  get "manage_departments" => "admin#departments"

    # Tasks
  get "new_task" => "tasks#new"
  post "create_task" => "tasks#create"
  get "tasks/:id/task_path" => "tasks#show", as: :task
  get "tasks/:id/set_due_date" => "tasks#set_due_date", as: :set_due_date
  post "tasks/:id/update_due_date" => "tasks#update_due_date", as: :update_due_date
  get "tasks/:id/cancel_due_date" => "tasks#cancel_due_date", as: :cancel_due_date

  get "tasks/:id/set_reviewer" => "tasks#set_reviewer", as: :set_reviewer
  post "tasks/:id/update_reviewer" => "tasks#update_reviewer", as: :update_reviewer
  get "tasks/:id/cancel_reviewer" => "tasks#cancel_reviewer", as: :cancel_reviewer

  get "tasks/:id/set_approver" => "tasks#set_approver", as: :set_approver
  post "tasks/:id/update_approver" => "tasks#update_approver", as: :update_approver
  get "tasks/:id/cancel_approver" => "tasks#cancel_approver", as: :cancel_approver

  get "tasks/:id/set_assigned" => "tasks#set_assigned", as: :set_assigned
  post "tasks/:id/update_assigned" => "tasks#update_assigned", as: :update_assigned
  get "tasks/:id/cancel_assigned" => "tasks#cancel_assigned", as: :cancel_assigned

  get "tasks/:id/set_department" => "tasks#set_department", as: :set_department
  post "tasks/:id/update_department" => "tasks#update_department", as: :update_department
  get "tasks/:id/cancel_department" => "tasks#cancel_department", as: :cancel_department

  get "tasks/:id/send_for_review" => "tasks#send_for_review", as: :send_for_review
  get "tasks/:id/send_for_approval" => "tasks#send_for_approval", as: :send_for_approval
  get "tasks/:id/reopen_task" => "tasks#reopen_task", as: :reopen_task
  get "tasks/:id/close_task" => "tasks#close_task", as: :close_task

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
