class PeriodUniversitiesController < ApplicationController
  before_action :set_period_university, only: [:show, :edit, :update, :destroy]

  # GET /period_universities
  # GET /period_universities.json
  def index
    @period_universities = PeriodUniversity.all
  end

  # GET /period_universities/1
  # GET /period_universities/1.json
  def show
  end

  # GET /period_universities/new
  def new
    @period_university = PeriodUniversity.new
  end

  # GET /period_universities/1/edit
  def edit
  end

  # POST /period_universities
  # POST /period_universities.json
  def create
    @period_university = PeriodUniversity.new(period_university_params)

    respond_to do |format|
      if @period_university.save
        format.html { redirect_to @period_university, notice: 'Period university was successfully created.' }
        format.json { render :show, status: :created, location: @period_university }
      else
        format.html { render :new }
        format.json { render json: @period_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /period_universities/1
  # PATCH/PUT /period_universities/1.json
  def update
    respond_to do |format|
      if @period_university.update(period_university_params)
        format.html { redirect_to @period_university, notice: 'Period university was successfully updated.' }
        format.json { render :show, status: :ok, location: @period_university }
      else
        format.html { render :edit }
        format.json { render json: @period_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /period_universities/1
  # DELETE /period_universities/1.json
  def destroy
    @period_university.destroy
    respond_to do |format|
      format.html { redirect_to period_universities_url, notice: 'Period university was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_period_university
      @period_university = PeriodUniversity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def period_university_params
      params.fetch(:period_university, {})
    end
end
