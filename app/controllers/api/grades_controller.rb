class Api::GradesController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@grades = Grade.all.order("id DESC"))
  end
  
  def show
    # respond_with(@grades = Grade.where("student_number =?", params[:id])) 
    respond_with(@grades = Grade.select("*").joins(:year_grade).where(:grades => {:student_number => params[:id]}))
  end

end