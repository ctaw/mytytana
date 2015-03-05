class AddCourseCodeToGradess < ActiveRecord::Migration
  def change
    add_column :grades, :course_code, :string
  end
end
