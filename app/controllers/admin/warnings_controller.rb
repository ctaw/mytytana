class Admin::WarningsController < AdminController

  before_action :set_warning_id, :only=> [:show, :edit, :update, :destroy]
  before_action :look_ups, :only => [:edit, :new, :update]

  def index
    @warnings = Warning.select("id, title").order("id ASC")
  end

  def new
    @warning = Warning.new
  end

  def create
    @warning = Warning.new(warning_params)
    if @warning.save
      redirect_to "/admin/warnings"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @warning = Warning.find(params[:id])
    if @warning.update(warning_params)
      redirect_to "/admin/warnings", notice: 'Warning was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @warning.destroy
    redirect_to action: :index
  end
  
  private

  def set_warning_id
    @warning = Warning.find(params[:id])
  end

  def look_ups
    @categories = [['Deficiency','1'],['Warning','0']]
  end

  def warning_params
    params.require(:warning).permit(:category, :title, :caption)    
  end
  
end