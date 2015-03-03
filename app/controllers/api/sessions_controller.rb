class Api::SessionsController < ApplicationController
  respond_to :xml, :json

  def show 
    respond_with(@student = Student.where("student_number =?", params[:id]).where("access_code =?", params[:access_code]))
  end
  
end