Rails.application.routes.draw do
  scope '/api', defaults: { format: 'json' } do
    devise_for :users,
               path: 'users',
               controllers: {
                 registrations: 'users/registrations',
                 sessions: 'users/sessions'
               }
  end
end
