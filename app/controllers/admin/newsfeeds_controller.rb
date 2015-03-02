class Admin::NewsfeedsController < AdminController

  def index
    @newsfeeds = Newsfeed.select("id, title, department, event_date, description, path_name").order("id ASC")
  end

  def new
    @newsfeed = Newsfeed.new
  end

  def create
    @newsfeed = Newsfeed.new(newsfeed_params)
    if @newsfeed.save
      redirect_to "/admin/newsfeeds"
    else
      render :new
    end
  end
  
  private

  def newsfeed_params
    params.require(:newsfeed).permit(:title, :department, :event_date, :description, :path_name)    
  end
  
end