class AccommodationsController < ApplicationController
  DATE_FORMAT = '%m/%d/%Y'.freeze
  # before_action :set_accommodation, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /accommodations
  # GET /accommodations.json
  def index
    @rooms = params[:rooms].present? ? params[:rooms] : 0
    @start_date = params[:start_date].present? ? params[:start_date] : Date.today.strftime(DATE_FORMAT)
    @end_date   = params[:end_date].present? ? params[:end_date] : (Date.today + 7).strftime(DATE_FORMAT)
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
      if unit['type'] == 'condominium' || unit['type'] == 'townhouse'
        if unit['bedrooms'] == @rooms.to_i && unit['occupancy'] == @guests.to_i
          @properties << unit
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
