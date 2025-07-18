Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs-dislike'
  mount Rswag::Api::Engine => '/api-docs-dislike'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
get '/up', to: proc { [200, { 'Content-Type' => 'application/json' }, [ { status: 'ok' }.to_json ]] }, as: :rails_health_check
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
delete '/dislike', to: 'likes#create'

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end

