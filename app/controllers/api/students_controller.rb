class Api::StudentsController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@students = Student.all.order("last_name ASC"))
  end

  def show
    respond_with(@students = Student.where("student_number =?", params[:id]).order("last_name ASC")) 
  end
  
end