Rails.application.routes.draw do
  root 'orders#index'

  get "profile/:id", to: 'user#show', as: :profile
  get 'aguardando-autorizacao', to: 'initial#show', as: :initial
  get 'solicitacoes', to: 'user#solicitacoes', as: :solicitacoes
  patch 'solicitacoes/:id/edit', to: 'user#update_solicitacao', as: :update_solicitacao

  get 'printers', to: 'printers#index', as: :printers
  post 'printers', to: 'printers#create'
  patch 'printers/:id', to: 'printers#update', as: :printer
  delete 'printers/:id', to: 'printers#destroy'

  get 'estoque/filamentos', to: 'filamentos#index', as: :filamentos
  post 'estoque/filamentos', to: 'filamentos#create'
  get 'estoque/get-filametos/:material_id/:cor_id', to: 'filamentos#get_filamentos', as: :get_filamentos

  post 'orders', to: 'orders#create'
  get 'orders/:id', to: 'orders#show', as: :order
  patch 'orders/:id', to: 'orders#update', as: :update_order
  post 'orders/:id', to: 'orders#finalizar', as: :finalizar_order

  post 'orders/:id/pecas', to: 'pecas#create', as: :pecas
  patch 'pecas/:id', to: 'pecas#update', as: :peca
  delete 'pecas/:id', to: 'pecas#destroy'


  post 'pecas/:id/printings', to: 'printings#create', as: :printings
  delete 'printings/:id', to: 'printings#destroy', as: :printing
  post 'printings/:id/finalizar', to: 'printings#finalizar', as: :finalizar_printing



  get 'users', to: 'user#index', as: :users


  devise_for :users, path: 'users', controllers:{sessions:"users/sessions", confirmations: "users/confirmations", 
      passwords: "users/passwords", registrations: "users/registrations", unlocks: "users/unlocks"}, path_names:{ sign_in: 'login', sign_out: 'logout', sign_up:'signup'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
