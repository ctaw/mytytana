class Admin::YearGradesController < AdminController

  before_action :set_event_id, :only=> [:show, :edit, :update, :destroy]
  before_action :look_ups, :only => [:edit, :new, :update]

  def index
    @year_grades = YearGrade.all
  end

  def new
    @year_grade = YearGrade.new
  end

  def create
    @year_grade = YearGrade.new(year_grade_params)
    if @year_grade.save
      redirect_to "/admin/year_grades"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @year_grade = YearGrade.find(params[:id])
    if @year_grade.update(year_grade_params)
      redirect_to "/admin/year_grades", notice: 'YearGrade was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @year_grade.destroy
    redirect_to action: :index
  end
  
  private

  def set_event_id
    @year_grade = YearGrade.find(params[:id])
  end

  def look_ups
    @sems = [['1st Semester','0'],['2nd Semester','1'],['Summer','2']]
    @sections = Section.where("course_id =?", 1).order("name ASC")
    @students = Student.select("student_number, first_name, last_name").where("course_id =?", 1).order("last_name ASC")
    @subjects = Subject.select("subject_code, course_code").where("course_code =?", "BSIT").order("course_code ASC")
    @courses = Course.select("course_code,course_code").order("course_code ASC")
  end

  def year_grade_params
    params.require(:year_grade).permit(:course_code, :section_id, :year, :sem, grades_attributes: [:id, :year_grade_id, :student_number, :subject_code, :prelim, :midterm, :final, :sem_grade])    
  end
  
end