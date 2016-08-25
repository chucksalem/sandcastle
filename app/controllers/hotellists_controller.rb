class HotellistsController < ApplicationController
  before_action :set_hotellist, only: [:show, :edit, :update, :destroy]

  # GET /hotellists
  # GET /hotellists.json
  def index
    @hotellists = Array.new
    file_path = File.join(Rails.root, '/spec/fixtures/units/hotellists.json')
    units_data = File.read(file_path)
    units = JSON.parse(units_data)
    units.each do |unit|
      @hotellists << unit if unit['type'] == 'condominium' || unit['type'] == 'townhouse'
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotellist
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotellist_params
    end
end
