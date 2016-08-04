class PagesController < ApplicationController
  def resources
    render
  end

  def contact
    render
  end

  def contact_thank_you
    ContactMailer.contact(
      email:      params[:email],
      first_name: params[:firstname],
      last_name:  params[:lastname],
      phone:      params[:phone],
      message:    params[:message]
    ).deliver_now
  end

  def owners_thank_you
    ContactMailer.work_order(
      email:      params[:email],
      first_name: params[:firstname],
      last_name:  params[:lastname],
      phone:      params[:phone],
      message:    params[:message]
    ).deliver_now
  end

  def testimonials
    render
  end

  def faq
    render
  end

  def maps
    render
  end

  def owners
    render
  end

  def trip_cancellation_insurance
    render
  end

  def about
    render
  end

  def facilities
    render
  end

  def policy
    render
  end

  def attractions
    render
  end

  def thankyou
    render
  end

  def newsletter
    ContactMailer.subscriber(
        email:      params[:emailId],
        message:    params[:message]
    ).deliver_now
  end

  def faqreview
    ContactMailer.faq_review(
        name:  params[:name],
        email:      params[:email],
        phonenumber:      params[:phonenumber],
        message:    params[:message]
    ).deliver_now
  end


  def room_details
    render
  end


  def booking_form
    render
  end


  def privacy_policy
    render
  end

end
