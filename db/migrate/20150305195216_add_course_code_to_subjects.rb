class AddCourseCodeToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :course_code, :string
  end
end
