Weebly::Application.routes.draw do
  resources :text_contents

  resources :nav_points

  resources :nav_contents

  resources :image_contents

  resources :title_contents

  resources :contents

  resources :pages do
    resources :elements do
      resources :contents
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  root 'home#index'


end
