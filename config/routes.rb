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
  get     "tarefas/:id/editar", to: "tasks#edit", as: "edit_task"
  patch   "tarefas/:id/editar", to: "tasks#update", as: false
  get     "tarefas/:id/remover", to: "tasks#remove", as: "remove_task"
  delete  "tarefas/:id/remover", to: "tasks#destroy", as: false
  post    "tarefas/adicionar", to: "tasks#create", as: "new_task"
  patch   "tarefas/atualizar", to: "tasks#batch_update", as: "update_tasks_in_batch"


end
