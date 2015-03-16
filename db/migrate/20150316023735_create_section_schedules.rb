class CreateSectionSchedules < ActiveRecord::Migration
  def change
    create_table :section_schedules do |t|
      t.string :course_code
      t.integer :section_id
      t.string :student_number
      t.timestamps
    end
  end

  add_column :sections, :course_id, :integer
end
