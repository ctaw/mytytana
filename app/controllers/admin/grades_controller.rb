class Admin::GradesController < AdminController

  before_action :set_grade_id, :only=> [:show, :edit, :update, :destroy]
  before_action :look_ups, :only => [:edit, :new, :update]

  def index
    @grades = Grade.select("id, student_number, subject_code, sem_grade, course_code").order("id ASC")
    @courses = Course.select("course_code,course_code").order("course_code ASC")
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)
    # @prelim = params[:grade][:prelim]
    # @midterm = params[:grade][:midterm]
    # @final = params[:grade][:final]
    # @grade_add = ((@prelim.to_i + @midterm.to_i + @final.to_i))
    # @sem_grade = @grade_add / 3

    # @grade.sem_grade = @sem_grade
    if @grade.save
      redirect_to "/admin/grades"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @grade = Grade.find(params[:id])
    if @grade.update(grade_params)
      redirect_to "/admin/grades", notice: 'News was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @grade.destroy
    redirect_to action: :index
  end

  def update_sections
    # updates sections based on course selected
    course = Course.where("course_code =?", params[:course_id])
    @sections = course.sections.map{|s| [s.name, s.id]}.insert(0, "Select Section")
  end
  
  private

  def look_ups
    @courses = Course.select("course_code,course_code").order("course_code ASC")
    @sems = [['1st Semester','0'],['2nd Semester','1'],['Summer','2']]
    @students = Student.select("student_number, first_name, last_name, course_code").where("course_code =?", params[:course_code]).order("last_name ASC")
    @subjects = Subject.select("subject_code, course_code").where("course_code =?", params[:course_code]).order("course_code ASC")
  end

  def set_grade_id
    @grade = Grade.find(params[:id])
  end

  def grade_params
    params.require(:grade).permit(:student_number, :year, :sem, :subject_code, :prelim, :midterm, :final, :sem_grade, :course_code)    
  end
  
end