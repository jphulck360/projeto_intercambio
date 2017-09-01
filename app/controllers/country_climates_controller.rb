class CountryClimatesController < ApplicationController
  before_action :set_country_climate, only: [:show, :edit, :update, :destroy]

  # GET /country_climates
  # GET /country_climates.json
  def index
    @country_climates = CountryClimate.all
  end

  # GET /country_climates/1
  # GET /country_climates/1.json
  def show
  end

  # GET /country_climates/new
  def new
    @country_climate = CountryClimate.new
  end

  # GET /country_climates/1/edit
  def edit
  end

  # POST /country_climates
  # POST /country_climates.json
  def create
    @country_climate = CountryClimate.new(country_climate_params)

    respond_to do |format|
      if @country_climate.save
        format.html { redirect_to @country_climate, notice: 'Country climate was successfully created.' }
        format.json { render :show, status: :created, location: @country_climate }
      else
        format.html { render :new }
        format.json { render json: @country_climate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /country_climates/1
  # PATCH/PUT /country_climates/1.json
  def update
    respond_to do |format|
      if @country_climate.update(country_climate_params)
        format.html { redirect_to @country_climate, notice: 'Country climate was successfully updated.' }
        format.json { render :show, status: :ok, location: @country_climate }
      else
        format.html { render :edit }
        format.json { render json: @country_climate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_climates/1
  # DELETE /country_climates/1.json
  def destroy
    @country_climate.destroy
    respond_to do |format|
      format.html { redirect_to country_climates_url, notice: 'Country climate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country_climate
      @country_climate = CountryClimate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_climate_params
      #params.fetch(:country_climate, {})
      params.require(:country_climate).permit(
        :country_id,
        :climate_id,
        countries_attributes:[:country_id],
        climates_attributes:[:climate_id]
      )
    end
end
