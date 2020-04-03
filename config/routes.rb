Rails.application.routes.draw do
  root 'orders#index'

  get "profile/:id", to: 'user#show', as: :profile
  get 'aguardando-autorizacao', to: 'initial#show', as: :initial
  get 'solicitacoes', to: 'user#solicitacoes', as: :solicitacoes
  patch 'solicitacoes/:id/edit', to: 'user#update_solicitacao', as: :update_solicitacao
  devise_for :users, path: 'users', controllers:{sessions:"users/sessions", confirmations: "users/confirmations", 
      passwords: "users/passwords", registrations: "users/registrations", unlocks: "users/unlocks"}, path_names:{ sign_in: 'login', sign_out: 'logout', sign_up:'signup'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
