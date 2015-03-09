class AddStudentNumberToWarnings < ActiveRecord::Migration
  def change
    add_column :warnings, :student_number, :string
    remove_column :courses, :name
    remove_column, :subjects, :name

    remove_column, :students, :gs_name
    remove_column, :students, :gs_location
    remove_column, :students, :gs_year
    remove_column, :students, :hs_name
    remove_column, :students, :hs_location
    remove_column, :students, :hs_year
  end
end