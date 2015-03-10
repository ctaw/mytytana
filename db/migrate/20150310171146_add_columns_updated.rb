class AddColumnsUpdated < ActiveRecord::Migration
  def change
    add_column :students, :unit_allowed, :string
    add_column :students, :year_level, :string
  end
end
