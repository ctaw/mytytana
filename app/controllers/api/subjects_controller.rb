class Api::SubjectsController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@subjects = Subject.all)
  end
  
end