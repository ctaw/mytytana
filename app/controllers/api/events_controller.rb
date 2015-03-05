class Api::EventsController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@events = Event.select("month, day, caption").order("id DESC"))
  end
  
end