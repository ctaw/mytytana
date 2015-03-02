class Admin::SubjectsController < AdminController

  def index
    @subjects = Subject.select("id, subject_code, name, description").order("id ASC")
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to "/admin/subjects"
    else
      render :new
    end
  end
  
  private

  def subject_params
    params.require(:subject).permit(:subject_code, :name, :description)    
  end

end