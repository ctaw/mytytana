class AddStudentNumberToWarnings < ActiveRecord::Migration
  def change
    add_column :warnings, :student_number, :string
    remove_column :courses, :name, :string
    remove_column, :subjects, :name, :string

    remove_column, :students, :gs_name, :string
    remove_column, :students, :gs_location, :text
    remove_column, :students, :gs_year, :string
    remove_column, :students, :hs_name,  :string
    remove_column, :students, :hs_location, :text
    remove_column, :students, :hs_year, :string
  end
end