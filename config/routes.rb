TodoList::Application.routes.draw do
  #nome do controller pode ser no plural ou singles
  #modelo SEMPRE no singular

  #os templates sao baseados no nome do controller
  root to: "login#new", via: :get

  get     "entrar",       to: "login#new", as: "login"
  post    "entrar",       to: "login#create", as: false
  delete  "sair",         to: "login#destroy", as: "logout"

  get     "cadastre-se",  to: "signup#new", as: "signup"
  post    "cadastre-se",  to: "signup#create", as: false

  get     "tarefas",      to: "tasks#index", as: "tasks"
  post    "tarefas/adicionar", to: "tasks#create", as: "new_task"

end
