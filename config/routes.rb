Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :shows do
    resources :episodes, only: :index
  end

  # resources :episodes do
  #   member do
  #     put :like
  #     put :dislike
  #   end
  # end

  scope '/episodes' do
    post '/like', to: 'episodes#like'
    delete '/like', to: 'episodes#delete_like'

    post '/dislike', to: 'episodes#dislike'
    delete '/dislike', to: 'episodes#delete_dislike'
  end
end
