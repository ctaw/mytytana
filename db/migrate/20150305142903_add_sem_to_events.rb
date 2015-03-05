class AddSemToEvents < ActiveRecord::Migration
  def change
    add_column :events, :year, :integer
    add_column :events, :sem, :integer
  end
end
