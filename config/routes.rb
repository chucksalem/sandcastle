Rails.application.routes.draw do

  resources :rentals
  get '/accommodations', to: "accommodations#index", as: "accommodations"
  post '/accommodations', to: "accommodations#show", as: "accommodation_show"
  get '/accommodations/:id', to: "accommodations#show", as: "accommodation_property"

  get '/hotellist', to: 'hotellists#index', as: 'hotellist_index'
  get '/rentals', to: 'rentals#index', as: 'rental_index'

  root 'home#index'

  # resources :accommodations, controller: :properties, only: [:index, :show]

  PagesController.action_methods.each do |action|
    get "/#{action}".dasherize, to: "pages##{action}", as: "#{action}_page"
  end

  post "/contact/thank-you".dasherize, to: "pages#contact_thank_you", as: "post_contact_thank_you_page"
  post "/owners/thank-you".dasherize, to: "pages#owners_thank_you", as: "post_owners_thank_you_page"
  post "/subscribe/newsletter".dasherize, to: "pages#newsletter", as: "post_newsletter"
  post "/faq/review".dasherize, to: "pages#faqreview", as: "post_faq_review"
  get '/offer', to: "home#offer"
  get '/room_details/:id', to: "pages#room_details", as: "room_details"
  get '/privacy_policy', to: "pages#privacy_policy"
  get '/new-client', to: "pages#new_client"
  get '/hotelgrid', to: "pages#hotelgrid"
  get '/hoteltest', to: "pages#hotellist"
  post '/booking-form', to: "pages#booking_form", as: 'book_now'
  get '/attraction-details', to: "pages#attraction_details"
  post "/thank-you", to: "pages#thankyou", as: "thank_you"

  namespace :api do
    resources :units, only: [:index, :show] do
      resources :stays, only: [:get]
    end
  end


end
