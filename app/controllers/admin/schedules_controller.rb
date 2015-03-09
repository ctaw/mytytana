class Admin::SchedulesController < AdminController

  before_action :set_schedule_id, :only=> [:show, :edit, :update, :destroy]
  before_action :look_ups, :only => [:edit, :new, :update]

  def index
    @schedules = Schedule.select("id, student_number, day, time, subject_code, section, room").order("id ASC")
    @courses = Course.select("course_code,course_code").order("course_code ASC")
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
  
  private

  def look_ups
    @course_coude = params[:course_code]
    @students = Student.select("student_number, first_name, last_name, course_code").where("course_code =?", params[:course_code]).order("last_name ASC")
    @courses = Course.select("course_code,course_code").order("course_code ASC")
    @days = [['Monday','0'],['Tuesday','1'],['Wednesday','2'],['Thursday','3'],['Friday','4'],['Saturday','5']]
    @sections = Section.select("course_code, name").where("course_code =?", params[:course_code]).order("name ASC")
    @subjects = Subject.select("subject_code, course_code").where("course_code =?", params[:course_code]).order("course_code ASC")
  end

  def set_schedule_id
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:student_number, :day, :time, :subject_code, :section, :room)    
  end
  
end