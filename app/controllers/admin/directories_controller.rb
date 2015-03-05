class Admin::DirectoriesController < AdminController

  before_action :set_directory_id, :only=> [:show, :edit, :update, :destroy]

  def index
    @directories = Directory.select("id, office, local_numbers").order("id ASC")
  end

  def new
    @directory = Directory.new
  end

  def create
    @directory = Directory.new(directory_params)
    if @directory.save
      redirect_to "/admin/directories"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @directory = Directory.find(params[:id])
    if @directory.update(directory_params)
      redirect_to "/admin/directories", notice: 'News was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @directory.destroy
    redirect_to action: :index
  end
  
  private

  def set_directory_id
    @directory = Directory.find(params[:id])
  end

  def directory_params
    params.require(:directory).permit(:office, :local_numbers)    
  end
  
end