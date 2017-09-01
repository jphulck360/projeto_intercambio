class CourseUniversitiesController < ApplicationController
  before_action :set_course_university, only: [:show, :edit, :update, :destroy]

  # GET /course_universities
  # GET /course_universities.json
  def index
    @course_universities = CourseUniversity.all
  end

  # GET /course_universities/1
  # GET /course_universities/1.json
  def show
  end

  # GET /course_universities/new
  def new
    @course_university = CourseUniversity.new
  end

  # GET /course_universities/1/edit
  def edit
  end

  # POST /course_universities
  # POST /course_universities.json
  def create
    @course_university = CourseUniversity.new(course_university_params)

    respond_to do |format|
      if @course_university.save
        format.html { redirect_to @course_university, notice: 'Course university was successfully created.' }
        format.json { render :show, status: :created, location: @course_university }
      else
        format.html { render :new }
        format.json { render json: @course_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_universities/1
  # PATCH/PUT /course_universities/1.json
  def update
    respond_to do |format|
      if @course_university.update(course_university_params)
        format.html { redirect_to @course_university, notice: 'Course university was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_university }
      else
        format.html { render :edit }
        format.json { render json: @course_university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_universities/1
  # DELETE /course_universities/1.json
  def destroy
    @course_university.destroy
    respond_to do |format|
      format.html { redirect_to course_universities_url, notice: 'Course university was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

####################### INÍCIO MÉTODOS CRIADOS ###########################

  def busca_normal
    @q = CourseUniversity.ransack(params[:q])
    @courses = @q.result
    #@buscar = Course.where("nome = ?",params[:busca_curso])
    #@courses = CourseUniversity.where("course_id = ?",@buscar)
  end

  def busca_personalizada

    @continentes = Continent.all
    @climas = Climate.all
    @linguas = Language.all
    @periodos = Period.all
    @custos = Cost.all

    #@continentes = Continent.all
    #@climas = Climate.all
    #@linguas = Language.all
    #@periodos = Period.all
    #@custos = Cost.all
  end

####################### FIM MÉTODOS CRIADOS ###########################

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_university
      @course_university = CourseUniversity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_university_params
      #params.fetch(:course_university, {})
      params.require(:course_university).permit(
        :busca_curso,
        :course_id,
        :university_id,
        :pesq_cont,
        courses_attributes:[:course_id,:nome],
        universities_attributes:[:university_id,:nome]
      )
    end
end
