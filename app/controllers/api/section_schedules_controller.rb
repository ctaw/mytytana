class Api::SectionSchedulesController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@section_schedules = Schedule.all.order("id DESC"))
  end

  def show
    respond_with(@section_schedules = SectionSchedule.select("*").joins(:section).where(:section_schedules => {:student_number => params[:id]}))
  end
  
end