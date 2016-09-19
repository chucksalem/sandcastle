class PagesController < ApplicationController
  DATE_FORMAT = '%m/%d/%Y'.freeze
  skip_before_action :verify_authenticity_token

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
    @booking_info = params
    ContactMailer.booking(
        name:       params[:first_name],
        email:      params[:email]
    ).deliver_now
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
    @price = !params[:price].blank? ? params[:price] : 0
    file_path = File.join(Rails.root, '/spec/fixtures/units/hotellists.json')
    units_data = File.read(file_path)
    units = JSON.parse(units_data)
    @booked_unit = units.select { |hash| hash['code'] == params[:id] }
    @unit_availability = lookup_rates(params)
  end

  def lookup_rates(params)
    @lookup         = true
    @available      = true
    @start_date        = !params[:start_date].blank? ? params[:start_date] : Date.today.strftime(DATE_FORMAT)
    @end_date          = !params[:end_date].blank? ? params[:end_date] : (Date.today + 7).strftime(DATE_FORMAT)
    start_date      = Date.strptime(@start_date, DATE_FORMAT)
    end_date        = Date.strptime(@end_date, DATE_FORMAT)
    @date_start     = start_date.strftime("%b %d, %Y")
    @date_end       = end_date.strftime("%b %d, %Y")
    @length_of_stay = end_date.mjd - start_date.mjd
    @guests         = "all"
    @guests         = @guests == "all" ? 1 : @guests
    @rates = Stay.lookup(params[:id],
                         start_date: start_date,
                         end_date: end_date,
                         guests: @guests)
    @nightly_rate      = '%.2f' % (@rates.base_amount / @length_of_stay)
    @base_amount       = '%.2f' % @rates.base_amount
    @tax_amount        = '%.2f' % @rates.taxes[0].amount
    @fees              = @rates.fees
    @total_amount      = '%.2f' % @rates.total_amount
  rescue Stay::Unavailable
    @available = false
  end

  def privacy_policy
    render
  end

end
