class Api::EventsController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@grades = Grade.all.order("id DESC"))
  end
  
  def show
    respond_with(@grades = Grade.where("student_number =?", params[:id]).order("last_name ASC")) 
  end
  
end