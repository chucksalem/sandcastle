class AccommodationsController < ApplicationController
  DATE_FORMAT = '%d/%m/%Y'.freeze
  # before_action :set_accommodation, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /accommodations
  # GET /accommodations.json
  def index
    @rooms = params[:rooms].present? ? params[:rooms] : 0
    @start_date = params[:start_date].present? ? params[:start_date] : Date.today.strftime(DATE_FORMAT)
    @end_date   = params[:end_date].present? ? params[:end_date] : (Date.today + 3).strftime(DATE_FORMAT)
    @date_start = Time.parse(@start_date).strftime("%m/%d/%y")
    @date_end = Time.parse(@end_date).strftime("%m/%d/%y")
    @guests = params[:guests].present? ? params[:guests] : 0
    @properties = Array.new
    file_path = File.join(Rails.root, '/spec/fixtures/units/hotellists.json')
    units_data = File.read(file_path)
    units = JSON.parse(units_data)
    @properties = if !is_search_request
      get_units(units)
    else
      get_all_units(units)
    end
  end

  def get_units(units)
    units.each do |unit|
      start_array = unit['start_date'].split("/")
      u_start_date = "#{start_array[1]}/#{start_array[0]}/#{start_array[2]}"
      unit_start_date = (Time.parse(u_start_date).strftime("%d/%m/%Y").to_time+1.day).to_i
      end_array = unit['end_date'].split("/")
      u_end_date = "#{end_array[1]}/#{end_array[0]}/#{end_array[2]}"
      unit_end_date = (Time.parse(u_end_date).strftime("%d/%m/%Y").to_time+1.day).to_i
      start_date = DateTime.parse(params[:start_date]).to_i
      end_date = DateTime.parse(params[:end_date]).to_i
      if unit['type'] == 'condominium' || unit['type'] == 'townhouse'
        if (unit['bedrooms'] == @rooms.to_i && unit['occupancy'] == @guests.to_i)
          if (unit_start_date >= start_date && unit_end_date >= end_date) ||
              (unit_start_date <= start_date && unit_end_date >= end_date)
            @properties << unit
          end
        end
      end
    end
    @properties.blank? ? [] : @properties
  end

  def get_all_units(units)
    units.each do |unit|
      @properties << unit if unit['type'] == 'condominium' || unit['type'] == 'townhouse'
    end
    @properties
  end

  # GET /accommodations/1
  # GET /accommodations/1.json
  def show
  end

  # GET /accommodations/new
  def new
    @accommodation = Accommodation.new
  end

  # GET /accommodations/1/edit
  def edit
  end

  # POST /accommodations
  # POST /accommodations.json
  def create
  end

  # PATCH/PUT /accommodations/1
  # PATCH/PUT /accommodations/1.json
  def update
  end

  # DELETE /accommodations/1
  # DELETE /accommodations/1.json
  def destroy
  end

  private

  def is_search_request
    (params[:rooms].to_s.blank? && params[:start_date].to_s.blank?) && (params[:end_date].to_s.blank? && params[:guests].to_s.blank?)
  end

end
