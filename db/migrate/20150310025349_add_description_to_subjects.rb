class AddDescriptionToSubjects < ActiveRecord::Migration
  def change
    add_column :grades, :description, :text
    add_column :grades, :unit_lec, :integer
    add_column :grades, :unit_lab, :integer
  end
end
