Rails.application.routes.draw do

  get 'sessions/new'

  root "pages#index"
  get "about", :to => "pages#about", :as => "about"
  get "place", :to => "pages#place", :as => "place"
  
  get 'login',    :to => 'sessions#new',      :as => 'login'
  get 'logout',   :to => 'sessions#destroy',  :as => 'logout'
  post 'sessions', :to => 'sessions#create',  :as => 'sessions'

  resources :users do
    resources :tasks do
      #STEp11-6で追加
      resources :tags, :only => [:create, :destroy]
        collection do
          get "unclosed"
        end

        member do
  #  get "done"でSTEp6-18のputとご設定のため、No Routeエラーで時間が要した。
          put "done"
        end
    end
  end
  
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
  
  #STEp完了後にDIVE11_メール送信実装、ここから
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  #ここまで
end
