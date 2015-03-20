class AddCols < ActiveRecord::Migration
  def change
    add_column :year_grades, :description, :text
    add_column :year_grades, :unit_lec, :integer
    add_column :year_grades, :unit_lab, :integer
  end
end
