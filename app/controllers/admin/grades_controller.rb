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

    @subj = params[:grade][:subject_code]
    @subject = Subject.where("subject_code =?", @subj).first
    
    @grade.description = @subject.description
    @grade.unit_lec = @subject.unit_lec
    @grade.unit_lab = @subject.unit_lab

    puts ">>>>>>>>>"
    puts @subj

    # if @grade.save
    #   redirect_to "/admin/grades"
    # else
    #   render :new
    # end
  end

  def show
  end

  def edit
  end

  def update
    @subj = params[:grade][:subject_code]
    @subject = Subject.where("subject_code =?", @subj).first

    @grade.description = @subject.description
    @grade.unit_lec = @subject.unit_lec
    @grade.unit_lab = @subject.unit_lab

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

  def subject_update
    puts ">>>>>>>>>>>>"
    @subject = Subject.where("subject_code =?", params[:subject_code])
    puts @subject.inspect
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
    params.require(:grade).permit(:student_number, :year, :sem, :subject_code, :prelim, :midterm, :final, :sem_grade, :course_code, :description, :unit_lec, :unit_lab)    
  end
  
end