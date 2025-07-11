Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs-count'
  mount Rswag::Api::Engine => '/api-docs-count'

  
  get '/up', to: proc { [200, { 'Content-Type' => 'application/json' }, [ { status: 'ok' }.to_json ]] }, as: :rails_health_check

  get '/likes/:post_id', to: 'likes#show'

end
