Rails.application.routes.draw do
  root 'home#index'

  resources :accommodations, controller: :properties, only: [:index, :show]

  PagesController.action_methods.each do |action|
    get "/#{action}".dasherize, to: "pages##{action}", as: "#{action}_page"
  end

  post "/contact/thank-you".dasherize, to: "pages#contact_thank_you", as: "post_contact_thank_you_page"
  post "/owners/thank-you".dasherize, to: "pages#owners_thank_you", as: "post_owners_thank_you_page"
  post "/subscribe/newsletter".dasherize, to: "pages#newsletter", as: "post_newsletter"
  post "/faq/review".dasherize, to: "pages#faqreview", as: "post_faq_review"
  get '/offer', to: "home#offer"

  namespace :api do
    resources :units, only: [:index, :show] do
      resources :stays, only: [:get]
    end
  end
end
