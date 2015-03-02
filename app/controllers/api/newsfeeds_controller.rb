class Api::NewsfeedsController < ApplicationController
  respond_to :xml, :json

  def index 
    respond_with(@newsfeeds = Newsfeed.all)
  end
  
end