class Api::SchedulesController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@schedules = Schedule.all.order("id DESC"))
  end

  def show
    respond_with(@schedules = Schedule.where("student_number =?", params[:id])) 
  end
  
end