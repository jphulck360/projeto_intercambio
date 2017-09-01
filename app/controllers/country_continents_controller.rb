class CountryContinentsController < ApplicationController
  before_action :set_country_continent, only: [:show, :edit, :update, :destroy]

  # GET /country_continents
  # GET /country_continents.json
  def index
    @country_continents = CountryContinent.all
  end

  # GET /country_continents/1
  # GET /country_continents/1.json
  def show
  end

  # GET /country_continents/new
  def new
    @country_continent = CountryContinent.new
  end

  # GET /country_continents/1/edit
  def edit
  end

  # POST /country_continents
  # POST /country_continents.json
  def create
    @country_continent = CountryContinent.new(country_continent_params)

    respond_to do |format|
      if @country_continent.save
        format.html { redirect_to @country_continent, notice: 'Country continent was successfully created.' }
        format.json { render :show, status: :created, location: @country_continent }
      else
        format.html { render :new }
        format.json { render json: @country_continent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /country_continents/1
  # PATCH/PUT /country_continents/1.json
  def update
    respond_to do |format|
      if @country_continent.update(country_continent_params)
        format.html { redirect_to @country_continent, notice: 'Country continent was successfully updated.' }
        format.json { render :show, status: :ok, location: @country_continent }
      else
        format.html { render :edit }
        format.json { render json: @country_continent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_continents/1
  # DELETE /country_continents/1.json
  def destroy
    @country_continent.destroy
    respond_to do |format|
      format.html { redirect_to country_continents_url, notice: 'Country continent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country_continent
      @country_continent = CountryContinent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def country_continent_params
      #params.fetch(:country_continent, {})
      params.require(:country_continent).permit(
        :country_id,
        :continent_id,
        countries_attributes:[:country_id],
        continents_attributes:[:continent_id]
      )
    end
end
