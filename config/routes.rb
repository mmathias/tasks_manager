TodoList::Application.routes.draw do
  #nome do controller pode ser no plural ou singles
  #modelo SEMPRE no singular

  #os templates sao baseados no nome do controller
  root to: "login#new", via: :get

  get "login", to: "login#new"
  post "login", to: "login#create"

  get   "/signup", to: "signup#new"
  post  "/signup", to: "signup#create"

  get  "/tasks", to: "tasks#index"
end
