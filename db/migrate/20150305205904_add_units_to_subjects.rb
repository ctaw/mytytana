class AddUnitsToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :unit_lec, :integer
    add_column :subjects, :unit_lab, :integer

    create_table :grades do |t|
      t.string :student_number
      t.integer :year
      t.text :sem
      t.string :subject_code
      t.string :prelim
      t.string :midterm
      t.string :final
      t.string :sem_grade
      t.timestamps
    end
  end
end
