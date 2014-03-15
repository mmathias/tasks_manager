TodoList::Application.routes.draw do
  #nome do controller pode ser no plural ou singles
  #modelo SEMPRE no singular

  #os templates sao baseados no nome do controller
  root to: "login#new", via: :get

  get     "login",      to: "login#new"
  post    "login",      to: "login#create"
  delete  "/logout",    to: "login#destroy"

  get     "/signup",    to: "signup#new"
  post    "/signup",    to: "signup#create"

  get     "/tasks",     to: "tasks#index"
  post     "/tasks/new", to: "tasks#create"

end
