class Admin::NewsfeedsController < AdminController

  before_action :set_newsfeed_id, :only=> [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
  end

  def update
    @newsfeed = Newsfeed.find(params[:id])
    if @newsfeed.update(newsfeed_params)
      redirect_to "/admin/newsfeeds", notice: 'News was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @newsfeed.destroy
    redirect_to action: :index
  end
  
  private

  def set_newsfeed_id
    @newsfeed = Newsfeed.find(params[:id])
  end

  def newsfeed_params
    params.require(:newsfeed).permit(:title, :department, :event_date, :description, :path_name)    
  end
  
end