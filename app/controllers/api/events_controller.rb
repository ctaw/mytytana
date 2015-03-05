class Api::EventsController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@events = Event.select("month, day, caption, updated_at").order("updated_at DESC"))
  end
  
end