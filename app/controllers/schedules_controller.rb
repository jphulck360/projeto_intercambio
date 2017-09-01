class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    # Lista todas os agendamentos
    @schedules = Schedule.all.paginate(:page => params[:page], :per_page => 30)
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  ########## MÉTODOS CRIADOS ##########
  def menu_agendamento
    @schedules = Schedule.all
  end

  def busca_normal
    #@courses = Course.all
    if params[:busca_curso].nil?
    else
      @buscar = Course.where("nome = ?",params[:busca_curso])
      #@pesq_curso = CourseUniversity.where("course_id = ?",@buscar)
      @pesq_curso = CourseUniversity.find_by_sql("
        select u.nome,c.nome,p.nome,u.valor,ct.custo from course_universities uc
        inner join universities u on uc.university_id = u.id
        inner join courses c on uc.course_id = c.id
        inner join costs ct on u.cost_id = ct.id
        inner join countries p on u.country_id = p.id
        where uc.course_id = #{@buscar};
      ")

      @q = @pesq_curso.ransack(params[:q])
      @courses = @q.result
    end
  end

  def busca_personalizada
    @busca_agenda = Schedule.find(params[:id])
    @schedules = Schedule.all
  end
  ########## MÉTODOS CRIADOS ##########



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(
        :dt_saida, :dt_retorno, :dias, :preco, :obs, :busca_curso,
        :continent_id,
        :country_id,
        :course_id,
        :student_id,
        :university_id,
        :user_id,
        continents_attributes:[:continent_id, :nome],
        countries_attributes:[:country_id, :nome],
        courses_attributes:[:course_id, :nome],
        students_attributes:[:student_id, :nome],
        universities_attributes:[:university_id, :nome],
        users_attributes:[:user_id, :nome]
      )
    end
end
