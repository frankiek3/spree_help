Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :question_categories do
      collection do
        post :update_question_positions
      end
    end

    delete '/questions/:id', to: "questions#destroy", as: :question
  end

  get '/faq', to: 'help#show_faq'
  get '/help', to: 'help#index'
  get '/contact', to: 'help#new_user_question'
  match '/help/question', to: "help#new_user_question", as: :user_question, via: [:get, :put]

#, on: :member

end
