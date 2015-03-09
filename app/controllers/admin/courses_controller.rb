class Admin::CoursesController < AdminController

  before_action :set_course_id, :only=> [:show, :edit, :update, :destroy]

  def index
    @courses = Course.select("id, course_code").order("id ASC")
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to "/admin/courses"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to "/admin/courses", notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to action: :index
  end
  
  private

  def set_course_id
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:course_code, :description)    
  end
  
end