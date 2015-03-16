class AddYearIdToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :year_grade_id, :integer
  end
end
