class Admin::SectionsController < AdminController

  before_action :set_section_id, :only=> [:show, :edit, :update, :destroy]
  before_action :look_ups, :only => [:edit, :new, :update]

  def index
    @sections = Section.select("id, course_code, name").order("id ASC")
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to "/admin/sections"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      redirect_to "/admin/sections", notice: 'News was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @section.destroy
    redirect_to action: :index
  end
  
  private

  def look_ups
    @courses = Course.select("course_code,name").order("name")
  end

  def set_section_id
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:course_code, :name)    
  end
  
end