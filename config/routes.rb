Baseball::Application.routes.draw do
  match 'stats', to: 'stats#index', via: [:get, :post]
  root 'stats#index'
end
