Rails.application.routes.draw do

  root 'user#home'

  #===========LOGIN============
  get 'login' => 'user#login'
  post 'sign_in' => 'user#sign_in'
  post 'logout' => "user#logout"

  #=========VIEW DORMS=========
  get 'view_dorms' => "user#view_dorms"
  get 'admin/modify_slots/:id' => 'admin#modify_slots'
  post 'admin/save' => 'admin#save'

  #===========APPLY============
  post 'apply' => "user#apply"
  get 'new_application' => "user#new_application"
  get 'renew' => "user#renew"
  
  post 'apply/save' => "user#save"
  post 'select' => 'user#select'
  post 'remove' => 'user#remove'
  get 'sort' => 'user#sort'
  
  #==========OTHERS============
  get 'admin/post' => 'admin#post'
  post 'admin/post_it' => 'admin#post_it'
  get 'admin/waitlist' => 'admin#waitlist'
  post 'admin/search' => 'admin#search_by_snum'
  get 'admin/add_to_waitlist' => 'admin#add_to_waitlist'
  get 'admin/grant_dorm' => 'admin#grant_dorm'
  

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
