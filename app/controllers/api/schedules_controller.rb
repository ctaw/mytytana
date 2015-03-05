class Api::SchedulesController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@schedules = Schedule.all.order("id DESC"))
  end
  
end