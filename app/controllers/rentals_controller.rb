class RentalsController < ApplicationController
  DATE_FORMAT = '%d/%m/%Y'.freeze
  include RentalsHelper

  # GET /hotellists
  # GET /hotellists.json
  def index
    @rooms = params[:rooms].present? ? params[:rooms] : 0
    @start_date = params[:start_date].present? ? params[:start_date] : Date.today.strftime(DATE_FORMAT)
    @end_date   = params[:end_date].present? ? params[:end_date] : (Date.today + 3).strftime(DATE_FORMAT)
    @date_start = !params[:start_date].blank? ? Time.parse(@start_date).strftime("%m/%d/%y") : ''
    @date_end = !params[:end_date].blank? ? Time.parse(@end_date).strftime("%m/%d/%y") : ''
    @guests = params[:guests].present? ? params[:guests] : 0
    @min_price = params[:min_price].present? ? params[:min_price] : 0
    @max_price = params[:max_price].present? ? params[:max_price] : 0
    @properties = Array.new
    properties = Array.new
    file_path = File.join(Rails.root, '/spec/fixtures/units/hotellists.json')
    units_data = File.read(file_path)
    units = JSON.parse(units_data)
    properties = if (!params.include? 'start_date') && (!params.include? 'end_date')
                    get_all_units(units)
                  elsif (!params[:rooms].blank? && @rooms.to_i != 0) &&
                      (@min_price.to_i == 0 && @max_price.to_i == 0) && @guests.to_i == 0
                    units_array = get_units_by_date_range(units)
                    get_units_by_rooms(units_array) unless units_array.blank?
                  elsif (!params[:guests].blank? && @guests.to_i != 0) &&
                      (@min_price.to_i == 0 && @max_price.to_i == 0) && @rooms.to_i == 0
                    units_array = get_units_by_date_range(units)
                    get_units_by_guests(units_array) unless units_array.blank?
                  elsif (@min_price.to_i >= 0 && @max_price.to_i > 0) &&
                      (@rooms.to_i == 0 && @guests.to_i == 0)
                    units_array = get_units_by_date_range(units)
                    get_units_by_price(units_array) unless units_array.blank?
                  elsif (!params[:rooms].blank? && @rooms.to_i != 0) &&
                      (@min_price.to_i >= 0 && @max_price.to_i > 0) && @guests.to_i == 0
                    units_array = get_units_by_date_range(units)
                    get_units_by_rooms_price(units_array) unless units_array.blank?
                  elsif (@rooms.to_i > 0 && @guests.to_i > 0) && (@min_price.to_i == 0 && @max_price.to_i == 0)
                    units_array = get_units_by_date_range(units)
                    get_units_by_rooms_guests(units_array) unless units_array.blank?
                  else
                    get_units_by_date_range(units)
                  end
    @properties = properties.sort_by {|obj| obj['stay_ranges'].first['price']}
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /hotellists/1
  # GET /hotellists/1.json
  def show
  end

  # GET /hotellists/new
  def new
  end

  # GET /hotellists/1/edit
  def edit
  end

  # POST /hotellists
  # POST /hotellists.json
  def create
  end

  # PATCH/PUT /hotellists/1
  # PATCH/PUT /hotellists/1.json
  def update
  end

  # DELETE /hotellists/1
  # DELETE /hotellists/1.json
  def destroy
  end

end
