class AddPathToStudents < ActiveRecord::Migration
  def change
    add_column :students, :path, :text
  end
end
