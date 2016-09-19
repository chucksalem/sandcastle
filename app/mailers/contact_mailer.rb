class ContactMailer < ActionMailer::Base
  default from: 'info@sandcastle.com'
  default to: 'saurabh_patil@tudip.com'
  require 'mailgun'
  require 'rest-client'

  def contact(email:, first_name:, last_name:, phone:, message:)
    @email      = email
    @first_name = first_name
    @last_name  = last_name
    @message    = message
    @phone      = phone

    mail(subject: 'Contact Form')
  end

  def work_order(email:, owner_name:, property_name:, message:)
    @email      = email
    @owner_name = owner_name
    @property_name = property_name
    @message    = message

    mail(subject: 'Work Order Form')
  end

  def subscriber(email:,message:)
    @email      = email
    @message    = message

    mail(subject: 'Newsletter',to: email)
    rest_api = RestClient.post("https://api:key-47c5f3ef74e3b937bbe9521ba8a81eda@api.mailgun.net/v3/lists/sandcastle@sandbox8120f6a879d1457a99765c0d2aeb2392.mailgun.org/members",
                    :subscribed => true,
                    :address => email)
  end

  def faq_review(name:, email:, phonenumber:, message:)
    @name       = name
    @email      = email
    @message    = message
    @phonenumber      = phonenumber

    mail(subject: 'FAQ Review',to:email)
  end

  def booking(name:, email:)
    @email      = email
    @name       = name
    mail(subject: 'Booking Confirmation', to:email)
  end

end