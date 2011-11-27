Chui::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  
  #Main
  get 'main/index', :as => 'index'
  match 'chui' => 'main#index', :as => 'chui'
  match 'loadIdeas/:id' => 'main#loadIdeas', :as => 'loadIdeas'
  match 'whatsNew' => 'main#whatsNew', :as => 'whatsNew'
  match 'search' => 'main#search', :as => 'search'
  match 'loadMore' => 'main#loadMore', :as => 'loadMore'

  #Accounts
  match 'facebook/login', :as => 'login'
  match 'facebook/callback'
  match 'main/logout', :as => 'logout'

  #Ideas
  match 'newIdea' => 'ideas#newIdea', :as => 'newIdea'
  match 'saveIdea' => 'ideas#saveIdea', :as => 'saveIdea'
  match 'idea/:id' => 'ideas#idea', :as => 'idea'
  match 'addToFavorites/:id' => 'ideas#addToFavorites', :as => 'addToFavorites'
  match 'removeFromFavorites/:id' => 'ideas#removeFromFavorites', :as => 'removeFromFavorites'
  match 'editIdea/:id' => 'ideas#editIdea', :as => 'editIdea'
  match 'cancelEditIdea/:id' => 'ideas#cancelEditIdea', :as => 'cancelEditIdea'
  match 'newResource' => 'ideas#newResource'

  #My Account
  match 'myAccount' => 'myAccount#index', :as => 'myAccount'

  #Profile
  match 'profile/:id' => 'profile#index', :as => 'profile'
  match 'loadProfileIdeas/:id/:item' => 'profile#loadProfileIdeas', :as => 'loadProfileIdeas'

  #Comments
  match 'newComment' => 'comments#newComment'

  #Votes Manager
  match 'makeVote' => 'vote_manager#makeVote'

  #Searcher
  match 'searcher' => 'searcher#index', :as => 'searcher'
  match 'results' => 'searcher#results', :as => 'results'

  root :to => "main#index"

end
