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
      start_date = DateTime.parse(@start_date).to_i
      end_date = DateTime.parse(@end_date).to_i
      if unit['type'] == 'condominium' || unit['type'] == 'townhouse'
        if (unit['bedrooms'] == @rooms.to_i && unit['occupancy'] == @guests.to_i) && !unit['stay_ranges'].blank?
          unit['stay_ranges'].each do |range|
            u_start_date = (Time.parse(range['start']).strftime("%d/%m/%Y").to_time+1.day).to_i
            u_end_date = (Time.parse(range['end']).strftime("%d/%m/%Y").to_time+1.day).to_i
            @properties << unit if (u_start_date <= start_date && u_end_date >= end_date) && (start_date <= end_date)
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
