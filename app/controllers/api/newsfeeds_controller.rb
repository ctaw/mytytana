class Api::NewsfeedsController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@newsfeeds = Newsfeed.all.order("event_date DESC"))
  end
  
end