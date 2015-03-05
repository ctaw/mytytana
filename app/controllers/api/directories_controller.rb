class Api::DirectoriesController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@directories = Directory.select("id, office, local_numbers").order("office ASC"))
  end
  
end