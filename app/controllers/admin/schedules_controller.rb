class Admin::SchedulesController < AdminController

  before_action :set_schedule_id, :only=> [:show, :edit, :update, :destroy]
  before_action :look_ups, :only => [:edit, :new, :update]

  def index
    @schedules = Schedule.all.order("id ASC")

  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to "/admin/schedules"
    else
      render :new
    end
  end

  def show
    @student = Student.where("course_code")
  end

  def edit
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to "/admin/schedules", notice: 'News was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to action: :index
  end

  def update_all
    puts ">>>>>"
    puts params[:id]
  end

  def add_more
    
  end
  
  private

  def look_ups
    @course_coude = params[:course_code]
    @students = Student.select("student_number, first_name, last_name").order("last_name ASC")
    #@courses = Course.select("course_code,course_code").order("course_code ASC")
    @days = [['Monday','0'],['Tuesday','1'],['Wednesday','2'],['Thursday','3'],['Friday','4'],['Saturday','5']]
    @sections = Section.select("course_code, name").where("course_code =?", params[:course_code]).order("name ASC")
    @subjects = Subject.select("id, subject_code")
  end

  def set_schedule_id
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:day, :time, :subject_id, :section_id, :room, section_schedules_attributes: [:id, :schedule_id, :student_number])    
  end
  
end