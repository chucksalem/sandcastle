class AccommodationsController < ApplicationController
  # before_action :set_accommodation, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /accommodations
  # GET /accommodations.json
  def index
    @rooms = params[:rooms].present? ? params[:rooms] : ''
    @guests = params[:guests].present? ? params[:guests] : ''
    @start_date = params[:start_date].present? ? params[:start_date] : ''
    @end_date   = params[:end_date].present? ? params[:end_date] : ''
    @properties = Array.new
    file_path = File.join(Rails.root, '/spec/fixtures/units/hotellists.json')
    units_data = File.read(file_path)
    units = JSON.parse(units_data)
    units.each do |unit|
      @properties << unit if (unit['type'] == 'condominium' || unit['type'] == 'townhouse') &&
                             unit['bedrooms'] == @rooms.to_i && unit['occupancy'] == @guests.to_i
    end
    @properties = @properties.blank? ? get_all_units(units) : @properties
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def accommodation_params
      params[:accommodation]
    end
end
