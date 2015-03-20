class AddScheduleId < ActiveRecord::Migration
  def change
    add_column :section_schedules, :schedule_id, :integer
    add_column :section_schedules, :subject_code, :string
    add_column :section_schedules, :section_name, :string
  end
end
