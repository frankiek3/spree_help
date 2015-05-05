Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :question_categories do
      collection do
        post :update_question_positions
      end
    end
    resources :user_questions
    resources :questions

    #delete '/questions/:id', to: "questions#destroy", as: :question
  end

  get '/faq', to: 'help#show_faq'
  get '/help', to: 'help#index'
  get '/contact', to: 'help#new_user_question'
  match '/help/question', to: "help#create_user_question", as: :user_question, via: [:post]

  #resources :user_question, :controller => 'contact#new', :only => [:new, :create]
  #get 'new_user_question' => 'contact_us/contacts#new', :as => :new_user_question


#, on: :member

end
