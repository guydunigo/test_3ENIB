Rails.application.routes.draw do
  root "pages#home"

  get "signup_student" => "students#new"
  post "signup_student" => "students#create"
  get "signup_company" => "company#new"
  post "signup_company" => "company#create"
  
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  put "students/:id/toggle_admin" => "students#toggle_admin"

  get "projects/:project_id/new" => "jobs#new"
  post "projects/:project_id/" => "jobs#create"
  put "undo_job/:id" => "jobs#undo"
  put "confirm_job/:id" => "jobs#confirm"
  put "reject_job/:id" => "jobs#reject"
  put "finish_job/:id" => "jobs#finish"

  put "projects/:id/undo" => "projects#undo"
  put "projects/:id/confirm" => "projects#confirm"
  put "projects/:id/launch" => "projects#launch"
  put "projects/:id/finish" => "projects#finish"

  resources :students
  resources :companies
  resources :projects
  resources :jobs, only: [:edit, :update, :destroy]

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
