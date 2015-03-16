class Admin::SectionSchedulesController < AdminController

  before_action :set_section_schedule_id, :only=> [:show, :edit, :update, :destroy]
  before_action :look_ups, :only => [:edit, :new, :update]

  def index
    @section_schedules = SectionSchedule.select("id, course_code, section_id, student_number").order("id ASC")
  end

  def new
    @section_schedule = SectionSchedule.new
  end

  def create
    @section_schedule = SectionSchedule.new(section_schedule_params)
    if @section_schedule.save
      redirect_to "/admin/section_schedules"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @section_schedule = SectionSchedule.find(params[:id])
    if @section_schedule.update(section_schedule_params)
      redirect_to "/admin/section_schedules", notice: 'News was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @section_schedule.destroy
    redirect_to action: :index
  end
  
  private

  def look_ups
    @courses = Course.select("course_code,course_code").order("course_code ASC")
  end

  def set_section_schedule_id
    @section_schedule = SectionSchedule.find(params[:id])
  end

  def section_schedule_params
    params.require(:section_schedule).permit(:course_code, :section_id, :student_number)    
  end
  
end