class Admin::SubjectsController < AdminController

  before_action :look_ups, :only => [:edit, :new, :update]
  before_action :set_subjec_id, :only=> [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.select("id, subject_code, description, course_code").order("id ASC")
  end

  def new
    @subject = Subject.new
    @subject.schedules.build
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to "/admin/subjects"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      redirect_to "/admin/subjects", notice: 'Subject was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    redirect_to action: :index
  end
  
  private

  def set_subjec_id
    @subject = Subject.find(params[:id])
  end

  def look_ups
    @courses = Course.select("course_code,course_code").order("course_code ASC")
    @days = [['Monday','0'],['Tuesday','1'],['Wednesday','2'],['Thursday','3'],['Friday','4'],['Saturday','5']]
    @sections = Section.select("id, name").where("course_id =?", 1).order("name ASC")
  end

  def subject_params
    params.require(:subject).permit(:subject_code, :description, :course_code, :unit_lec, :unit_lab, schedules_attributes: [:id, :subject_id, :section_id, :day, :time, :room])    
  end

end