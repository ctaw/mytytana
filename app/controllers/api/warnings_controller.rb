class Api::WarningsController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@warnings = Warning.all.order("id DESC"))
  end
  
end