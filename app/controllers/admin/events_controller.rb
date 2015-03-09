class Admin::EventsController < AdminController

  before_action :set_event_id, :only=> [:show, :edit, :update, :destroy]
  before_action :look_ups, :only => [:edit, :new, :update]

  def index
    @events = Event.select("id, month, day, caption").order("id ASC")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to "/admin/events"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to "/admin/events", notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to action: :index
  end
  
  private

  def set_event_id
    @event = Event.find(params[:id])
  end

  def look_ups
    @sems = [['1st Semester','0'],['2nd Semester','1'],['Summer','2']]
    @months = [['January','January'],['February','February'],['March','March'],['April','April'],['May','May'],['June','June'],['July','July'],['August','August'],['September','September'],['November','November'],['December','December']]
  end

  def event_params
    params.require(:event).permit(:month, :day, :caption, :year, :sem)    
  end
  
end