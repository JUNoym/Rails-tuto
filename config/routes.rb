Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup', to: 'users#new' 
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :microposts, only: [:create, :destroy]
end

# HTTPリクエスト	URL	名前付きルート	アクション名	用途
# GET	/login	login_path	new	新しいセッションのページ（ログイン）
# POST	/login	login_path	create	新しいセッションの作成（ログイン）
# DELETE	/logout	logout_path	destroy	セッションの削除（ログアウト）