class Admin::StudentsController < AdminController

  before_action :set_student_id, :only=> [:show, :edit, :update, :destroy]
  before_action :look_ups, :only => [:edit, :new, :update]

  def index
    @students = Student.select("id, student_number, first_name, last_name, course_code, curriculum_year").order("last_name ASC")
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to "/admin/students"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to "/admin/students", notice: 'News was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to action: :index
  end
  
  private

  def set_student_id
    @student = Student.find(params[:id])
  end

  def look_ups
    @gender = [['Male','1'],['Female','0']]
    @enrollment_status = [['Regular','Regular'],['Irregular','Irregular']]
    @civil_status = [['Single','Single'],['Married','Married'],['Widowed', 'Widowed'],['Divorce','Divorce']]
    @courses = Course.select("course_code, name").order("name ASC")
  end

  def student_params
    params.require(:student).permit(:student_number, :access_code, :first_name, :middle_name, :last_name, :extension_name, :course_code, :curriculum_year,
      :enrollment_status, :gender, :birthday, :birthplace, :civil_status, :nationality, :religion, :address, :city, :contact_number,
      :email, :guardian_name, :guardian_address, :guardian_contact_number, :gs_name, :gs_location, :gs_year, :hs_name, :hs_location, :hs_year)    
  end
  
end