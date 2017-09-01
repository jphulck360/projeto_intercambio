class CityUniversitiesController < ApplicationController
  before_action :set_city_university, only: [:show, :edit, :update, :destroy]

  # GET /city_universities
  # GET /city_universities.json
  def index
    @city_universities = CityUniversity.all
  end

  # GET /city_universities/1
  # GET /city_universities/1.json
  def show
  end

  # GET /city_universities/new
  def new
    @city_university = CityUniversity.new
  end

  # GET /city_universities/1/edit
  def edit
  end

  # POST /city_universities
  # POST /city_universities.json
  def create
    @city_university = CityUniversity.new(city_university_params)

    respond_to do |format|
      if @city_university.save
        format.html { redirect_to @city_university, notice: 'City university was successfully created.' }
        format.json { render :show, status: :created, location: @city_university }
      else
        format.html { render :new }
        format.json { render json: @city_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /city_universities/1
  # PATCH/PUT /city_universities/1.json
  def update
    respond_to do |format|
      if @city_university.update(city_university_params)
        format.html { redirect_to @city_university, notice: 'City university was successfully updated.' }
        format.json { render :show, status: :ok, location: @city_university }
      else
        format.html { render :edit }
        format.json { render json: @city_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_universities/1
  # DELETE /city_universities/1.json
  def destroy
    @city_university.destroy
    respond_to do |format|
      format.html { redirect_to city_universities_url, notice: 'City university was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city_university
      @city_university = CityUniversity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_university_params
      #params.fetch(:city_university, {})
      params.require(:city_university).permit(
        :city_id,
        :university_id,
        cities_attributes:[:city_id,:nome],
        universities_attributes:[:university_id,:nome]
      )
    end
end
