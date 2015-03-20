class CreateYearGrades < ActiveRecord::Migration
  def change
    create_table :year_grades do |t|
      t.string :course_code
      t.integer :section_id
      t.integer :year
      t.integer :sem
      t.string :subject_code
      t.timestamps
    end
  end
end
