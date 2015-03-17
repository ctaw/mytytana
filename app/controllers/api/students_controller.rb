class Api::StudentsController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@students = Student.all.order("last_name ASC"))
  end

  def show
    respond_with(@students = Student.select("*").joins(:course).where(:students => {:student_number => params[:id]}))
  end

  
  
end 


# SELECT student_number FROM students T1 INNER JOIN courses T2 ON T1.course_id = T2.id;

# Course.preload(:students)