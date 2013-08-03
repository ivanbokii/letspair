Letspair::Application.routes.draw do
  root :to => 'welcome#index'

  resources :users do
    resources :pairsessions, controller: :user_pairsessions do
      get 'for-date/:date', action: :fordate, on: :collection
      get 'markers', action: :markers, on: :collection
    end
  end

  resources :sessions
  resources :pairsessions do
    get 'for-date/:date', action: :fordate, on: :collection
    get 'markers', action: :markers, on: :collection
    post 'contact', action: :contact
  end

  get 'get_users', to: 'users#get_users'

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

end
