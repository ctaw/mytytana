class AddScheduleId < ActiveRecord::Migration
  def change
    add_column :section_schedules, :schedule_id, :integer
  end
end
