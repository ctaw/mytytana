class AddCourseCodeToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :course_code, :string
  end
end
