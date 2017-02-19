Rails.application.routes.draw do
  scope '/api', defaults: { format: 'json' } do
    devise_for :users,
               path: 'users',
               controllers: {
                 registrations: 'registrations',
                 sessions: 'sessions'
               }
    resources :users
    resources :records
    post '/unplugg_callback', to: 'predictions#callback'
  end
end
