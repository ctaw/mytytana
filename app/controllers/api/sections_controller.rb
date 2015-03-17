class Api::SectionsController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@sections = Section.all.order("name ASC"))
  end

  def show
    respond_with(@sections = Section.select("*").joins(:section_schedules).where(:section_schedules => {:student_number => params[:id]}))
  end

  
  
end 


# SELECT student_number FROM students T1 INNER JOIN courses T2 ON T1.course_id = T2.id;

# Course.preload(:students)